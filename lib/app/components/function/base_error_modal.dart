import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/base_data.dart';
import '../config/config.dart';
import '../widget/Custom_elevatedButton.dart';
import '../widget/Custom_text.dart';
import 'helper.dart';

class BaseModal {
  BaseModal();

  Future<dynamic> show({
    required String title,
    required String content,
    required Function() onSuccess,
  }) {
    return betterShowMessage(
        backButton: false,
        title: title,
        content: Container(
          // height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(
                  text: content,
                  maxLines: 3,
                  fontType: FontType.bodyMedium,
                  // weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      name: 'Kembali',
                      width: Get.width / 3.2,
                      height: 40,
                      isText: true,
                      color: ZFOtherColors.white,
                      sideColor: ZFOtherColors.black,
                      sideWidth: 1.2,
                      maxWidth: 400,
                      colorText: ZFOtherColors.black,
                    ),
                    CustomElevatedButton(
                      onPressed: onSuccess,
                      name: 'Masuk',
                      width: Get.width / 3.2,
                      height: 40,
                      color: ColorPalettes.primaryContainer,
                      sideColor: ZFOtherColors.black,
                      sideWidth: 1.2,
                      maxWidth: 400,
                      isText: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        context: Get.context!);
  }
}
