import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:card_loading/card_loading.dart';
import 'package:get/get.dart';

import '../config/base_data.dart';
import '../config/config.dart';
import '../widget/Custom_text.dart';

Widget loadingBar({
  required double height,
  required double width,
  required double radius,
  Color? color,
}) {
  return CardLoading(
    cardLoadingTheme: CardLoadingTheme(
      colorOne: color ?? Color.fromARGB(255, 240, 240, 240),
      colorTwo: color?.withOpacity(0.5) ??
          Color.fromARGB(255, 240, 240, 240).withOpacity(0.5),
    ),
    height: height,
    width: width,
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    margin: const EdgeInsets.only(bottom: 10),
  );
}

const kartu3 = CardLoading(
  height: 160,
);
const kartu2 = CardLoading(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  height: 50,
);

const kartu = CardLoading(
  height: 10,
  width: 200,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  margin: EdgeInsets.only(bottom: 10),
);
final kartu4 = CardLoading(
  height: 22,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(25)),
  margin: const EdgeInsets.only(bottom: 10),
);
final kartuSell = CardLoading(
  height: 60,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  margin: const EdgeInsets.only(bottom: 10),
);
final kartuLingkaran = CardLoading(
  height: 40,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(40)),
  margin: const EdgeInsets.only(bottom: 10),
);

Map<String, dynamic> dataDummy = {
  "status": false,
  "message": "Loading",
  "data": []
};
Future<void> betterShowMessage({
  required context,
  required String title,
  required Widget content,
  bool? isButton,
  required bool backButton,
  List<Widget>? buttons,
  Function()? onDefaultOK,
  IconData? icon,
  Function()? onBack,
}) {
  buttons ??= [
    TextButton(
        onPressed: onDefaultOK ??
            () {
              Navigator.pop(context);
            },
        child: const Text('OK')),
  ];

  return showDialog(
      context: context,
      // barrierDismissible: true, // user must tap button!
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Row(
              children: [
                backButton
                    ? IconButton(
                        onPressed: onBack ?? null,
                        icon: Icon(icon ?? Icons.abc),
                      )
                    : Container(),
                Container(
                  width: Get.width / 2,
                  child: CustomText(
                    text: title,
                    maxLines: 10,
                    fontType: FontType.titleMedium,
                    weight: FontWeight.bold,
                    // colorText: ZFOtherColors.white,
                  ),
                ),
              ],
            ),
            content: content,
            // actions: isButton == false ? null : buttons,
          );
        });
      });
}

String getActualPassword(String? encoded64) {
  return utf8.decode(base64.decode(encoded64!));
}

Widget buildCupertinoPrivasiSyaratdanKetentuanModal(name, text) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    body: Column(
      children: [
        CustomText(
          text: name,
          maxLines: 3,
          fontType: FontType.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomText(
                  text: text,
                  maxLines: 200,
                  fontType: FontType.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
