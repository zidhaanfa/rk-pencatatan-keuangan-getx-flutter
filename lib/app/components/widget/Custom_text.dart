import 'package:flutter/material.dart';
import '../config/config.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    required this.fontType,
    this.opacityText,
    this.weight,
    this.textAlign,
    this.maxLines,
    this.colorText,
    this.decoration,
    this.fontStyle,
    this.textStyle,
  }) : super(key: key);

  String text;
  final FontType fontType;
  final FontWeight? weight;
  final double? opacityText;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? colorText;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextStyle? style;
    double? opacity = opacityText ?? 1;
    switch (fontType) {
      case FontType.displayLarge:
        style = theme.textTheme.displayLarge!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.displayMedium:
        style = theme.textTheme.displayMedium!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.displaySmall:
        style = theme.textTheme.displaySmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.headlineLarge:
        style = theme.textTheme.headlineLarge!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.headlineMedium:
        style = theme.textTheme.headlineMedium!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.headlineSmall:
        style = theme.textTheme.headlineSmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.titleLarge:
        style = theme.textTheme.titleLarge!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.titleMedium:
        style = theme.textTheme.titleMedium!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.titleSmall:
        style = theme.textTheme.titleSmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.bodyLarge:
        style = theme.textTheme.bodyLarge!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText,
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.bodyMedium:
        style = theme.textTheme.bodyMedium!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText,
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.bodySmall:
        style = theme.textTheme.bodySmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.labelLarge:
        style = theme.textTheme.labelLarge!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.labelMedium:
        style = theme.textTheme.labelMedium!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      case FontType.labelSmall:
        style = theme.textTheme.labelSmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText?.withOpacity(opacity),
          decoration: decoration,
          fontStyle: fontStyle,
        );
        break;
      default:
        style = theme.textTheme.bodySmall!.copyWith(
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
          color: colorText,
          decoration: decoration,
          fontStyle: fontStyle,
        );
    }
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: style,
      maxLines: maxLines,
    );
  }
}
