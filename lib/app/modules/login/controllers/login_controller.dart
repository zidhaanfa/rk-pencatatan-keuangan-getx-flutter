import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/api_call_status.dart';
import '../models/login_models_model.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  LoginModels? loginModels;

  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameFirstRegisterController =
      TextEditingController();
  final TextEditingController nameLastRegisterController =
      TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController confirmPasswordRegisterController =
      TextEditingController();
  final isObsecure = true.obs;
  final rememberMe = false.obs;
  final isLoginForm = true.obs;

  final isLoadingLogin = false.obs;
  final isErrorLogin = false.obs;
  final errorMessageLogin = ''.obs;
  ApiCallStatus apiCallStatusLogin = ApiCallStatus.holding;

  @override
  void onInit() {
    emailController.text = 'zidanfath@recehkoding.com';
    passwordController.text = 'Derina@6661FA';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void changeForm() {
    isLoginForm.value = !isLoginForm.value;
  }

  void changeRememberMe(bool? value) {
    rememberMe.value = !rememberMe.value;
  }
}
