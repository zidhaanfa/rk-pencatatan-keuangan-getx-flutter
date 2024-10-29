import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/config.dart';
import '/config/theme/my_theme.dart';

import 'Custom_text.dart';

class CustomCardSetting extends StatelessWidget {
  CustomCardSetting({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  String title;
  List<CustomCardSettingItem> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Row(
            children: [
              Flexible(
                child: CustomText(
                  text: title,
                  fontType: FontType.titleMedium,
                  textAlign: TextAlign.left,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 5),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }
}

class CustomCardSettingItem extends StatelessWidget {
  CustomCardSettingItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
    this.cardColor,
    this.titleColor,
    this.subtitleColor,
    this.elevation,
  }) : super(key: key);

  IconData? icon;
  String title;
  String? subtitle;

  Color? titleColor;
  Color? subtitleColor;
  Function()? onTap;
  Widget? trailing;
  Color? cardColor;
  double? elevation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Card(
        elevation: elevation ?? 1,
        color: cardColor,
        child: ListTile(
          leading: icon != null
              ? Icon(
                  icon,
                )
              : null,
          title: CustomText(
            text: title,
            fontType: FontType.bodyLarge,
            colorText: titleColor,
          ),
          subtitle: subtitle != null
              ? CustomText(
                  text: subtitle ?? '',
                  fontType: FontType.bodySmall,
                  colorText: subtitleColor,
                )
              : null,
          trailing: trailing != null ? trailing : Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
