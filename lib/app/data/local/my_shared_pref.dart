import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _accessToken = 'access_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';

  // STORING KEY USER
  static const String _userId = 'user_id';
  static const String _userName = 'user_name';
  static const String _userEmail = 'user_email';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ??
      true; // todo set the default theme (true for light, false for dark)

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _sharedPreferences.getString(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated fcm token
  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get authorization token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  /// save authorization token
  static Future<void> setAccessToken(String token) =>
      _sharedPreferences.setString(_accessToken, token);

  /// get authorization token
  static String? getAccessToken() => _sharedPreferences.getString(_accessToken);

  /// save user
  static Future<void> setUser(int id, String name, String email) async {
    await _sharedPreferences.setInt(_userId, id);
    await _sharedPreferences.setString(_userName, name);
    await _sharedPreferences.setString(_userEmail, email);
  }

  /// get user
  static Map<String, String> getUser() {
    String name = _sharedPreferences.getString(_userName) ?? '';
    String email = _sharedPreferences.getString(_userEmail) ?? '';
    return {'name': name, 'email': email};
  }

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
}
