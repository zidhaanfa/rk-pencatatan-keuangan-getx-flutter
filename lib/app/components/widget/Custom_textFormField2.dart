import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField2 extends StatelessWidget {
  CustomTextFormField2({
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
    this.readOnly,
    this.maxLines,
    this.height,
    this.onEditingComplete,
    this.color,
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
  bool? readOnly;
  int? maxLines;
  double? height;
  Function()? onEditingComplete;
  Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool errorForm = false;
    return Column(
      children: [
        Container(
          height: height,
          child: CupertinoTextField(
            controller: controller,
            obscureText: obsecureText ?? false,
            autofocus: false,
            enabled: enable,
            clipBehavior: Clip.antiAlias,
            cursorColor: Colors.orange,
            cursorWidth: 2,
            style: TextStyle(
              color: theme.textTheme.bodyMedium!.color,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            cursorOpacityAnimates: true,
            enableIMEPersonalizedLearning: true,
            enableSuggestions: true,
            keyboardType: keyboardType,
            placeholder: name,
            onChanged: (value) {
              if (withError != null && value.isEmpty) {
                // Handle the error message appropriately here
                // For example, you could use a state management solution to update the UI
                // with the error message
                print('Error: $errorText');
                errorForm = true;
              }
            },
            enableInteractiveSelection: true,
            onEditingComplete: onEditingComplete,
            placeholderStyle: TextStyle(
              color: theme.textSelectionTheme.selectionColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            prefix: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      prefixIcon,
                      color: prefixColorIcon ??
                          theme.textSelectionTheme.selectionColor,
                      size: prefixSizeIcon ?? 30,
                    ),
                  )
                : null,
            suffix: suffixIcon != null
                ? IconButton(
                    onPressed: suffixOnPressed,
                    icon: Icon(
                      suffixIcon,
                      color: suffixColorIcon ??
                          theme.textSelectionTheme.selectionColor,
                      size: suffixSizeIcon ?? 30,
                    ))
                : null,
            readOnly: readOnly ?? false,
            suffixMode: OverlayVisibilityMode.always,
            maxLines: maxLines,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (color ??
                        theme.textSelectionTheme.selectionColor
                            ?.withOpacity(0.3)) ??
                    Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        if (errorForm == true)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
