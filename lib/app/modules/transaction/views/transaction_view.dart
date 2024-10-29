import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/widget/Custom_appBar.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ----------------------- Header ----------------------- //
          CustomAppBar(
            pageName: 'Transactions',
            subTitle: 'Control your transactions',
            withImage: false,
          ),
        ],
      ),
    );
  }
}
