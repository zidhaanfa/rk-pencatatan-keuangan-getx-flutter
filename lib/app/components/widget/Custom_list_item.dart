import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/config.dart';
import 'Custom_text.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key? key,
    this.isCategory,
    this.isFavorite,
    this.isTag,
    this.categoryBgColor,
    this.cardColor,
    this.onTap,
    this.elevation,
  }) : super(key: key);

  bool? isCategory;
  bool? isFavorite;
  bool? isTag;
  Color? categoryBgColor;
  Color? cardColor;
  Function()? onTap;
  double? elevation;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      hoverColor: theme.buttonTheme.colorScheme!.primary.withOpacity(0.5),
      splashFactory: InkRipple.splashFactory,
      onTap: onTap,
      child: Card(
        borderOnForeground: true,
        elevation: elevation ?? 1,
        color: cardColor ?? theme.cardColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/app_icon.png',
                  width: 1.sw,
                  height: 0.18.sh,
                  fit: BoxFit.cover,
                ),
                isCategory != null || isCategory == true
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: categoryBgColor ??
                                Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.r),
                            ),
                          ),
                          child: CustomText(
                            text: 'Category',
                            fontType: FontType.titleSmall,
                            colorText: Colors.white,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.left,
                    text:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit sdds sd sd sdf sdf s d',
                    maxLines: 2,
                    fontType: FontType.titleSmall,
                    weight: FontWeight.bold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isTag != null || isTag == true
                          ? Container(
                              height: 47.h,
                              width: 0.75.sw,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: Chip(
                                      backgroundColor: theme
                                          .buttonTheme.colorScheme!.primary
                                          .withOpacity(0.5),
                                      color: MaterialStatePropertyAll(
                                        theme.buttonTheme.colorScheme!.primary
                                            .withOpacity(0.5),
                                      ),
                                      label: CustomText(
                                        text: 'Tag',
                                        fontType: FontType.bodySmall,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                      isFavorite != null || isFavorite == true
                          ? Container(
                              height: 52.h,
                              width: 52.h,
                              // decoration: BoxDecoration(
                              //   color: theme.primaryColor,
                              //   borderRadius: BorderRadius.circular(8.r),
                              // ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: theme.buttonTheme.colorScheme!.primary,
                                  // size: 28.sp,
                                ),
                                onPressed: () {},
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
