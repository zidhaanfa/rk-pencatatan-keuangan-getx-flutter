import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
// import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../components/custom_snackbar.dart';
import '../components/function/snackbar.dart';
import 'api_exceptions.dart';

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}

class BaseClient {
  static var logger = Logger(
    output: ConsoleOutput(),
    level: Level.debug,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      colors: true,
      printEmojis: true,
      lineLength: 120,
      levelEmojis: {
        Level.verbose: '📝',
        Level.debug: '🐛',
        Level.info: 'ℹ️',
        Level.warning: '⚠️',
        Level.error: '🚨',
        Level.wtf: '🤷‍♂️',
      },
    ),
  );
  static final Dio _dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('REQUEST[${options.method}] => PATH: ${options.path}');
            print('REQUEST[${options.method}] => HEADERS: ${options.headers}');
            print('REQUEST[${options.method}] => DATA: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print(
                'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
            print(
                'RESPONSE[${response.statusCode}] => HEADERS: ${response.headers}');
            print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print(
                'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
            print(
                'ERROR[${e.response?.statusCode}] => HEADERS: ${e.response?.headers}');
            print(
                'ERROR[${e.response?.statusCode}] => DATA: ${e.response?.data}');
          }
          return handler.next(e);
        },
      ),
    );
  // ..interceptors.add(
  //   TalkerDioLogger(
  //     settings: TalkerDioLoggerSettings(
  //       printRequestHeaders: true,
  //       printResponseHeaders: true,
  //       printResponseMessage: true,
  //       responseFilter: (response) => response.statusCode != 200,
  //       printErrorData: true,
  //       printErrorMessage: true,
  //     ),
  //   ),
  // );

  // request timeout (default 10 seconds)
  // static const int _timeoutInSeconds = 60;
  // request timeout duration
  static Duration timeout = const Duration(minutes: 1);

  /// dio getter (used for testing)
  static get dio => _dio;

  /// perform safe api request
  static safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
    Function? onLoading,
    bool? startLoading,
    Function(bool)? isError,
    Function(bool)? isLoading,
    String? loadingMessage,
    dynamic data,
  }) async {
    try {
      if (kDebugMode) {
        logger.i(
            'Api Call: $url \n Api Query: $queryParameters \n Api Data: $data \n Api Headers: $headers');
      }

      // 1) indicate loading state
      await onLoading?.call();
      isError?.call(false);
      isLoading?.call(true);
      startLoading == false || startLoading == null
          ? null
          : EasyLoading.show(
              status: loadingMessage ?? 'loading...',
              maskType: EasyLoadingMaskType.black,
              dismissOnTap: true,
            );
      // 2) try to perform http request
      Response? response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.patch) {
        response = await _dio.patch(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }
      // 3) return response (api done successfully)
      EasyLoading.dismiss();
      isLoading?.call(false);
      await onSuccess(response);
    } on DioException catch (error) {
      EasyLoading.dismiss();
      // dio error (api reach the server but not performed successfully
      _handleDioError(error: error, url: url, onError: onError);
      isError?.call(true);
      isLoading?.call(false);
    } on SocketException {
      EasyLoading.dismiss();
      isError?.call(true);
      isLoading?.call(false);
      // No internet connection
      _handleSocketException(url: url, onError: onError);
    } on TimeoutException {
      EasyLoading.dismiss();
      isError?.call(true);
      isLoading?.call(false);
      // Api call went out of time
      _handleTimeoutException(url: url, onError: onError);
    } catch (error, stackTrace) {
      EasyLoading.dismiss();
      isError?.call(true);
      isLoading?.call(false);
      // print the line of code that throw unexpected exception
      logger.e(stackTrace);
      // unexpected error for example (parsing json error)
      _handleUnexpectedException(url: url, onError: onError, error: error);
    }
  }

  /// download file
  static download(
      {required String url, // file url
      required String savePath, // where to save file
      Function(ApiException)? onError,
      Function(int value, int progress)? onReceiveProgress,
      required Function onSuccess}) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(receiveTimeout: timeout, sendTimeout: timeout),
        onReceiveProgress: onReceiveProgress,
      );
      onSuccess();
    } catch (error) {
      var exception = ApiException(url: url, message: error.toString());
      onError?.call(exception) ?? _handleError(error.toString());
    }
  }

  /// handle unexpected error
  static _handleUnexpectedException(
      {Function(ApiException)? onError,
      required String url,
      required Object error}) {
    if (onError != null) {
      onError(ApiException(
        message: error.toString(),
        url: url,
      ));
    } else {
      _handleError(error.toString());
    }
  }

  /// handle timeout exception
  static _handleTimeoutException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: 'server not responding',
        url: url,
      ));
    } else {
      _handleError('server not responding');
    }
  }

  /// handle timeout exception
  static _handleSocketException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: 'no internet connection',
        url: url,
      ));
    } else {
      _handleError('no internet connection');
    }
  }

  /// handle Dio error
  static _handleDioError(
      {required DioException error,
      Function(ApiException)? onError,
      required String url}) {
    // no internet connection
    if (error.type == DioExceptionType.connectionError) {
      return _handleSocketException(url: url, onError: onError);
    }

    // 404 error
    if (error.response?.statusCode == 404) {
      if (onError != null) {
        return onError(ApiException(
          message: 'Url not found',
          url: url,
          statusCode: 404,
        ));
      } else {
        return _handleError('Url not found');
      }
    }

    // no internet connection
    if (error.message != null &&
        error.message!.toLowerCase().contains('socket')) {
      if (onError != null) {
        return onError(ApiException(
          message: 'no internet connection',
          url: url,
        ));
      } else {
        return _handleError('no internet connection');
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: 'server error',
        url: url,
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    var exception = ApiException(
        url: url,
        message: error.message ?? 'Un Expected Api Error!',
        response: error.response,
        statusCode: error.response?.statusCode);
    if (onError != null) {
      return onError(exception);
    } else {
      return handleApiError(exception);
    }
  }

  /// handle error automaticly (if user didnt pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
  static handleApiError(ApiException apiException) {
    String msg = apiException.toString();
    CustomSnackBar.showCustomErrorToast(message: msg);
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    CustomSnackBar.showCustomErrorToast(message: msg);
  }
}
