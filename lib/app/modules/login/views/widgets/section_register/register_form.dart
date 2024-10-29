import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/config/base_data.dart';
import '../../../../../components/config/config.dart';
import '../../../../../components/widget/Custom_elevatedButton.dart';
import '../../../../../components/widget/Custom_text.dart';
import '../../../../../components/widget/Custom_text2.dart';
import '../../../../../components/widget/Custom_textButton.dart';
import '../../../../../components/widget/Custom_textFormField.dart';
import '../../../controllers/login_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

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
              20.verticalSpace,
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
                      text: 'Register Account',
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
                    Row(
                      children: [
                        Flexible(
                          child: CustomText(
                            text: 'Create an account to continue! ',
                            fontType: FontType.bodySmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    CustomTextFormField(
                      name: 'First Name',
                      controller: controller.nameFirstRegisterController,
                      enable: true,
                      errorText: 'Please enter first name',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      name: 'Last Name',
                      controller: controller.nameLastRegisterController,
                      enable: true,
                      errorText: 'Please enter last name',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      name: 'Email',
                      controller: controller.emailRegisterController,
                      enable: true,
                      errorText: 'Please enter email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      name: 'Password',
                      controller: controller.passwordRegisterController,
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
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: controller.changeRememberMe,
                            activeColor: theme.buttonTheme.colorScheme!.primary,
                            side: BorderSide(
                              color: ColorPalettes.primary,
                            ),
                            semanticLabel: 'Remember Me',
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            splashRadius: 20,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                        ),
                        CustomText(
                          text: 'Remember Me',
                          fontType: FontType.bodyMedium,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                      isText: true,
                      onPressed: () {
                        // Get.to(() => CustomNavigationBarView(),
                        //     binding: BindingsBuilder.put(
                        //         () => CustomNavigationBarBinding()));
                      },
                      name: 'Register',
                      height: 50,
                      width: double.infinity,
                      color: theme.buttonTheme.colorScheme!.primary,
                      colorText: theme.buttonTheme.colorScheme!.onPrimary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Have an account?',
                          fontType: FontType.bodyMedium,
                        ),
                        CustomTextButton(
                          text: 'Login',
                          fontType: FontType.bodyMedium,
                          colorText: theme.buttonTheme.colorScheme!.primary,
                          onPressed: () {
                            controller.changeForm();
                            // Get.to(() => LoginView(),
                            //     binding:
                            //         BindingsBuilder.put(() => LoginBinding()));
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
