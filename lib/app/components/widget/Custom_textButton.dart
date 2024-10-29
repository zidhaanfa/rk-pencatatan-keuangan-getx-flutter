import 'package:flutter/material.dart';

import '../config/config.dart';
import 'Custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    required this.fontType,
    this.opacityText,
    this.weight,
    this.textAlign,
    this.maxLines,
    this.colorText,
    this.decoration,
    this.onPressed,
  }) : super(key: key);

  String text;
  final FontType fontType;
  final FontWeight? weight;
  final double? opacityText;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? colorText;
  final TextDecoration? decoration;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontType: fontType,
        opacityText: opacityText,
        weight: weight,
        textAlign: textAlign,
        maxLines: maxLines,
        colorText: colorText,
        decoration: decoration,
      ),
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(Colors.orange),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
