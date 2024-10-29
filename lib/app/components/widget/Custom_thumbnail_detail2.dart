import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/config.dart';
import 'Custom_text.dart';
import 'Custom_widget_max_width.dart';

class CustomThumbnailDetail2 extends StatelessWidget {
  CustomThumbnailDetail2({
    Key? key,
    this.isCategory,
    this.categoryBgColor,
  }) : super(key: key);

  bool? isCategory;
  Color? categoryBgColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: CustomWidgetMaxWidth(
            maxWidth: 1.sw,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/sample_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        isCategory != null || isCategory == true
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: categoryBgColor ?? Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
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
    );
  }
}
