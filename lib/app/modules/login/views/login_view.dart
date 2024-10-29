import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'widgets/section_login/login_form.dart';
import 'widgets/section_register/register_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isLoginForm.value == true,
        child: LoginForm(),
        replacement: RegisterForm(),
      );
    });
  }
}
