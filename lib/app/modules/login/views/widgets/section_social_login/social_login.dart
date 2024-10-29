import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app/components/widget/Custom_elevatedButton.dart';

import '../../../../../components/config/config.dart';
import '../../../../../components/widget/Custom_text.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black.withOpacity(0.3),
                width: 0.3.sw,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'OR',
                  fontType: FontType.bodyMedium,
                  colorText: theme.primaryColor,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
                width: 0.3.sw,
                height: 1,
              ),
            ],
          ),
        ),
        CustomElevatedButton(
          onPressed: () {},
          name: 'Google',
          height: 50,
          width: double.infinity,
          radius: 10,
          isText: false,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/vectors/logo-google.svg',
                width: 30.w,
                height: 30.h,
              ),
              10.horizontalSpace,
              CustomText(
                text: 'Sign in with Google',
                fontType: FontType.bodyMedium,
                weight: FontWeight.bold,
                colorText: Colors.black,
              ),
            ],
          ),
          color: Color.fromARGB(255, 255, 255, 255),
          sideColor: Colors.white,
        ),
        10.verticalSpace,
        CustomElevatedButton(
          onPressed: () {},
          name: 'Facebook',
          height: 50,
          width: double.infinity,
          radius: 10,
          isText: false,
          widget: SvgPicture.asset(
            'assets/vectors/logo-facebook.svg',
            width: 30.w,
            height: 30.h,
          ),
          color: Colors.white,
          sideColor: Colors.white,
        ),
        10.verticalSpace,
      ],
    );
  }
}
