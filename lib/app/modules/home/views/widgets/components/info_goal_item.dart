import 'package:flutter/material.dart';

import '../../../../../components/widget/Custom_card1.dart';

class InfoGoalItem extends StatelessWidget {
  const InfoGoalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return CustomCard1(
          title: 'Goal 1',
          subtitle: 'Save 1M in 1 year',
          part: '1%',
        );
      },
    );
  }
}
