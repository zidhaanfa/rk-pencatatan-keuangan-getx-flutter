import 'package:flutter/material.dart';
import '/app/components/config/config.dart';

import 'Custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.name,
    required this.height,
    required this.width,
    this.color,
    this.radius,
    this.colorText,
    this.sideColor,
    this.sideWidth,
    this.maxHeight,
    this.maxWidth,
    this.withIcon,
    this.icon,
    this.iconColor,
    this.iconSize,
    required this.isText,
    this.widget,
    this.fontType,
    this.fontWeight,
  }) : super(key: key);

  Function()? onPressed;
  String name;
  double width;
  double height;
  Color? color;
  double? radius;
  Color? colorText;
  Color? sideColor;
  double? sideWidth;
  double? maxHeight;
  double? maxWidth;
  bool? withIcon;
  IconData? icon;
  Color? iconColor;
  double? iconSize;
  bool isText;
  Widget? widget;
  FontType? fontType;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: isText == true
          ?
          // Text(
          //     name,
          //     style: TextStyle(
          //       color: colorText ?? Colors.white,
          //       fontSize: 20,
          //     ),
          //   )
          CustomText(
              text: name,
              fontType: fontType ?? FontType.titleMedium,
              colorText: colorText ?? theme.textTheme.titleMedium!.color,
              weight: fontWeight ?? FontWeight.normal,
              // maxLines: 3,
            )
          : widget,
      style: ButtonStyle(
        side: MaterialStatePropertyAll(BorderSide(
          color: sideColor ?? theme.buttonTheme.colorScheme!.primary,
          width: sideWidth ?? 1,
        )),
        shape: radius == null
            ? null
            : MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      radius ?? 12,
                    ),
                  ),
                ),
              ),
        backgroundColor: MaterialStatePropertyAll(
          color ?? theme.buttonTheme.colorScheme!.primary,
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(maxWidth ?? 400, maxHeight ?? 60),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(width, height),
        ),
      ),
    );
  }
}
