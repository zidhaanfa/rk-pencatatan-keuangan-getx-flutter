import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/budget/views/budget_view.dart';
import 'package:getx_skeleton/app/modules/setting/views/setting_view.dart';
import 'package:getx_skeleton/app/modules/transaction/views/transaction_view.dart';

import '../../home/views/home_view.dart';

class NavigationBarController extends GetxController {
  //TODO: Implement NavigationBarController

  final count = 0.obs;
// Selected Menu Index for Navigation Bar
  final selectedMenu = 0.obs;
// List of Pages to be displayed in the Navigation Bar
  late List<Widget> pages;
// Initial Page to be displayed
  late HomeView homeView;
  late TransactionView transactionView;
  late BudgetView budgetView;
  late SettingView settingView;

// Global Key for the Navigation Bar
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void onInit() {
    super.onInit();
    homeView = HomeView();
    transactionView = TransactionView();
    budgetView = BudgetView();
    settingView = SettingView();

    pages = [
      homeView,
      transactionView,
      budgetView,
      settingView,
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
