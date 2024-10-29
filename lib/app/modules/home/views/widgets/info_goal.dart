import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/config/config.dart';
import '../../../../components/widget/Custom_text.dart';
import '../../../../components/widget/Custom_textButton.dart';
import 'components/info_goal_item.dart';

class InfoGoal extends StatelessWidget {
  const InfoGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomText(
                text: 'Your Goals',
                fontType: FontType.bodyLarge,
                weight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomTextButton(
                text: 'View All',
                colorText: theme.primaryColor,
                onPressed: () {},
                fontType: FontType.titleSmall,
              ),
            ),
          ],
        ),
        InfoGoalItem(),
      ],
    );
  }
}
