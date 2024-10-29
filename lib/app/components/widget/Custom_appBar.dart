import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.pageName,
    this.subTitle,
    this.trailingIcon,
    this.onTrailingTap,
    this.trailingColor,
    this.withTrailing,
    this.withImage,
    this.image,
    this.trailingWidget,
    this.color,
  });

  String pageName;
  String? subTitle;
  IconData? trailingIcon;
  Function()? onTrailingTap;
  Color? trailingColor;
  bool? withTrailing;
  bool? withImage;
  String? image;
  Widget? trailingWidget;
  Color? color;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //----------------white circles decor----------------//
          Positioned(
            right: 0,
            top: -125.h,
            child: CircleAvatar(
              backgroundColor: theme.secondaryHeaderColor.withOpacity(0.08),
              radius: 111,
            ),
          ),
          Positioned(
            right: -7.w,
            top: -160.h,
            child: CircleAvatar(
              backgroundColor: theme.secondaryHeaderColor.withOpacity(0.08),
              radius: 111,
            ),
          ),

          Positioned(
            right: -21.w,
            top: -195.h,
            child: CircleAvatar(
              backgroundColor: theme.secondaryHeaderColor.withOpacity(0.08),
              radius: 111,
            ),
          ),

          Positioned(
            left: -21.w,
            bottom: -195.h,
            child: CircleAvatar(
              backgroundColor: theme.secondaryHeaderColor.withOpacity(0.08),
              radius: 111,
            ),
          ),

          //----------------Data row ----------------//
          Positioned(
            bottom: 10,
            right: 16.w,
            left: 16.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                withImage == null || withImage == true
                    ? Container(
                        height: 39.h,
                        width: 39.h,
                        decoration: BoxDecoration(
                          color: theme.secondaryHeaderColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: theme.secondaryHeaderColor.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: Image.asset(
                              image ?? 'assets/images/person1.png',
                              height: double.infinity,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                9.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 0.6.sw,
                      child: Text(
                        pageName,
                        maxLines: 1,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          // color: theme.primaryTextTheme.headline1?.color,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      subTitle ?? 'Zidanfath',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          // color: theme.primaryTextTheme.headline1?.color,
                          // fontSize: 12.sp,
                          ),
                    ),
                  ],
                ),
                const Spacer(),

                //----------------Theme Button----------------//
                withTrailing == null || withTrailing == true
                    ? IconButton(
                        splashColor: Colors.transparent,
                        onPressed: onTrailingTap,
                        icon: Icon(
                          trailingIcon ?? CupertinoIcons.bell_fill,
                          color: trailingColor,
                          // size: 25.sp,
                        ),
                      )
                    : trailingWidget ?? SizedBox(),

                10.horizontalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
