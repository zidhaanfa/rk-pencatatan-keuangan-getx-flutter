import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.name,
    required this.controller,
    required this.enable,
    required this.errorText,
    required this.keyboardType,
    this.prefixIcon,
    this.prefixColorIcon,
    this.prefixSizeIcon,
    this.suffixOnPressed,
    this.suffixIcon,
    this.suffixColorIcon,
    this.suffixSizeIcon,
    this.obsecureText,
    this.withError,
    this.color,
    this.fillColor,
  }) : super(key: key);

  String name;
  TextEditingController controller;
  bool enable;
  String errorText;
  TextInputType keyboardType;
  IconData? prefixIcon;
  Color? prefixColorIcon;
  double? prefixSizeIcon;
  Function()? suffixOnPressed;
  IconData? suffixIcon;
  Color? suffixColorIcon;
  double? suffixSizeIcon;
  bool? obsecureText;
  bool? withError;
  Color? color;
  Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        fillColor: fillColor ?? Colors.transparent,
        constraints: BoxConstraints(
          minHeight: 50,
        ),
        alignLabelWithHint: true,
        counter: const SizedBox(),
        counterStyle: const TextStyle(height: double.minPositive),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color:
                    prefixColorIcon ?? theme.buttonTheme.colorScheme!.primary,
                size: prefixSizeIcon ?? 30,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixOnPressed,
                icon: Icon(
                  suffixIcon,
                  color:
                      suffixColorIcon ?? theme.buttonTheme.colorScheme!.primary,
                  size: suffixSizeIcon ?? 30,
                ))
            : null,
      ),
      obscureText: obsecureText ?? false,
      autofocus: false,
      enabled: enable,
      clipBehavior: Clip.antiAlias,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: withError != null || withError == true
          ? (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            }
          : (value) {
              return null;
            },
      cursorOpacityAnimates: true,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
    );
  }
}
