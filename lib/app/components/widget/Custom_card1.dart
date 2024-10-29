import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/my_theme.dart';
import '../config/config.dart';
import 'Custom_text.dart';

class CustomCard1 extends StatelessWidget {
  CustomCard1({
    Key? key,
    required this.title,
    this.bottomWidget,
    required this.subtitle,
    this.part,
    this.image,
    this.icon,
    this.partColor,
    this.elevation,
    this.borderColor,
    this.cardColor,
    this.titleColor,
    this.subtitleColor,
    this.allPadding,
    this.onTap,
    this.splashColor,
  }) : super(key: key);

  String title;
  Widget? bottomWidget;
  String subtitle;
  String? part;
  String? image;
  IconData? icon;
  Color? partColor;
  double? elevation;
  Color? borderColor;
  Color? cardColor;
  Color? titleColor;
  Color? subtitleColor;
  double? allPadding;
  Function()? onTap;
  Color? splashColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        right: 12.0,
        left: 12.0,
      ),
      child: InkWell(
        splashColor: splashColor ?? theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Card(
          color: cardColor,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(
              color: borderColor ?? theme.dividerColor,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              part != null
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: partColor ??
                              theme.colorScheme.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                          ),
                        ),
                        child: CustomText(
                          text: '$part',
                          fontType: FontType.titleSmall,
                          colorText: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
              Padding(
                padding: EdgeInsets.all(allPadding ?? 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: image != null
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.start,
                      children: [
                        image != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/person1.png',
                                    width: 0.25.sw,
                                    height: 0.1.sh,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5),
                          child: Container(
                            width: 0.5.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: title,
                                  fontType: FontType.titleMedium,
                                  weight: FontWeight.bold,
                                  colorText: titleColor,
                                ),
                                Row(
                                  children: [
                                    //icon timer and text
                                    icon != null
                                        ? Icon(
                                            icon ?? Icons.calendar_today,
                                            color: theme.colorScheme.primary,
                                            size: 20,
                                          )
                                        : SizedBox(),
                                    CustomText(
                                      text: subtitle,
                                      fontType: FontType.bodyMedium,
                                      weight: FontWeight.normal,
                                      colorText: subtitleColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    bottomWidget ?? Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
