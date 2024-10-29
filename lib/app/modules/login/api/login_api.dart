import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/controllers/login_controller.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../../../services/base_url.dart';
import '../models/login_models_model.dart';

class LoginApi extends GetxController {
  LoginController loginController = Get.put(LoginController());

  getDataLogin() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      URL.login, // url
      RequestType.post, // request type (get,post,delete,put)
      isLoading: (loading) {
        // loading state
        loginController.isLoadingLogin(loading);
      },
      isError: (error) {
        // error state
        loginController.isErrorLogin(error);
      },
      onLoading: () {
        // *) indicate loading state
        loginController.apiCallStatusLogin = ApiCallStatus.loading;
        update();
      },
      data: jsonEncode(
        {
          "email": loginController.emailController.text,
          "password": loginController.passwordController.text,
        },
      ),
      onSuccess: (responseMap) {
        Map<String, dynamic> responseMaps = responseMap.data;
        // api done successfully
        var responseMapData = responseMaps;
        // prefs = await SharedPreferences.getInstance();
        LoginModels.fromJson(responseMapData);
        loginController.loginModels = LoginModels.fromJson(responseMaps);

        // *) indicate success state
        loginController.apiCallStatusLogin = ApiCallStatus.success;

        //save token to shared pref
        MySharedPref.setAccessToken(loginController.loginModels!.accessToken!);
        MySharedPref.setUser(
            loginController.loginModels!.data!.id!,
            loginController.loginModels!.data!.name!,
            loginController.loginModels!.data!.email!);

        // *) update the UI
        update();

        // go to Navigation Bar Page
        Get.toNamed(Routes.NAVIGATION_BAR);
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        loginController.apiCallStatusLogin = ApiCallStatus.error;
        // error message
        loginController.errorMessageLogin(error.toString());
        update();
      },
    );
  }
}
