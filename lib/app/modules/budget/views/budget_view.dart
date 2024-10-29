import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/widget/Custom_appBar.dart';
import '../controllers/budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ----------------------- Header ----------------------- //
          CustomAppBar(
            pageName: 'Budgets',
            subTitle: 'Manage your budget',
            withImage: false,
          ),
        ],
      ),
    );
  }
}
