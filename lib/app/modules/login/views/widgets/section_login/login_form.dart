import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../api/login_api.dart';
import '/config/theme/my_theme.dart';

import '../../../../../components/config/base_data.dart';
import '../../../../../components/config/config.dart';
import '../../../../../components/widget/Custom_elevatedButton.dart';
import '../../../../../components/widget/Custom_text.dart';
import '../../../../../components/widget/Custom_text2.dart';
import '../../../../../components/widget/Custom_textButton.dart';
import '../../../../../components/widget/Custom_textFormField.dart';
import '../../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    LoginController controller = Get.put(LoginController());
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              50.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/recehkoding-logo.png',
                  height: 80,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText2(
                      text: 'Welcome Back👋🏻',
                      fontType: FontType.headlineLarge,
                      maxLines: 3,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'to ',
                          fontType: FontType.headlineLarge,
                          maxLines: 3,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'RK CuanTrack',
                          fontType: FontType.headlineLarge,
                          maxLines: 3,
                          weight: FontWeight.bold,
                          colorText: theme.buttonTheme.colorScheme!.primary,
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    CustomText2(
                      text: 'Enter your email and password to log in ',
                      fontType: FontType.bodySmall,
                      textAlign: TextAlign.start,
                    ),
                    10.verticalSpace,
                    CustomTextFormField(
                      name: 'Email',
                      controller: controller.emailController,
                      enable: true,
                      errorText: 'Please enter email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    5.verticalSpace,
                    CustomTextFormField(
                      name: 'Password',
                      controller: controller.passwordController,
                      enable: true,
                      errorText: 'Please enter password',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      suffixIcon: controller.isObsecure.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixOnPressed: controller.changeObsecure,
                      obsecureText: controller.isObsecure.value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: controller.changeRememberMe,
                                activeColor:
                                    theme.buttonTheme.colorScheme!.primary,
                                side: BorderSide(
                                  color: ColorPalettes.primary,
                                ),
                                semanticLabel: 'Remember Me',
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                splashRadius: 20,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                              ),
                            ),
                            CustomText(
                              text: 'Remember Me',
                              fontType: FontType.bodyMedium,
                              maxLines: 3,
                            ),
                          ],
                        ),
                        CustomTextButton(
                          text: 'Forgot Password?',
                          fontType: FontType.bodyMedium,
                          colorText: Colors.red,
                          onPressed: () {
                            // Get.to(() => ForgotPasswordView(),
                            //     binding: BindingsBuilder.put(
                            //         () => ForgotPasswordBinding()));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                      isText: true,
                      onPressed: () {
                        LoginApi loginApi = LoginApi();
                        loginApi.getDataLogin();
                      },
                      name: 'Login',
                      height: 50,
                      radius: 12,
                      width: double.infinity,
                      color: theme.buttonTheme.colorScheme!.primary,
                      colorText: theme.buttonTheme.colorScheme!.onPrimary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // SocialLogin(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Don\'t have an account?',
                          fontType: FontType.bodyMedium,
                        ),
                        CustomTextButton(
                          text: 'Sign Up',
                          fontType: FontType.bodyMedium,
                          colorText: theme.buttonTheme.colorScheme!.primary,
                          onPressed: () {
                            controller.changeForm();
                            // Get.to(() => RegisterView(),
                            //     binding: BindingsBuilder.put(
                            //         () => RegisterBinding()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
