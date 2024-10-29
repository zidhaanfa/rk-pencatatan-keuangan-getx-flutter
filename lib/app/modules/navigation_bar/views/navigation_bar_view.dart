import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigation_bar_controller.dart';

import '../../home/bindings/home_binding.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    NavigationBarController c = Get.put(NavigationBarController());
    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          if (c.selectedMenu.value != 0) {
            c.selectedMenu.value = 0;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              // bottomLeft: Radius.circular(40),
              // bottomRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              backgroundColor: theme.backgroundColor,
              key: c.navigatorKey,
              elevation: 2,
              // backgroundColor: Color.fromARGB(255, 255, 255, 255),
              items: const [
                //Home Page item
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house),
                  tooltip: "Home",
                  label: "Home",
                ),
                //Courses Page item
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.moneyBillTrendUp),
                  tooltip: "Transactions",
                  label: "Transactions",
                ),
                //Blog Page item
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.chartPie),
                  tooltip: "Budgets",
                  label: "Budgets",
                ),
                //Account Page item
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gear),
                  tooltip: "Account",
                  label: "Account",
                ),
              ],
              enableFeedback: true,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              useLegacyColorScheme: true,
              type: BottomNavigationBarType.shifting,
              fixedColor: theme.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: c.selectedMenu.value,
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey[300],
                fontWeight: FontWeight.w300,
              ),
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              selectedIconTheme: IconThemeData(
                color: theme.primaryColor,
              ),
              unselectedIconTheme: IconThemeData(
                color: theme.unselectedWidgetColor,
              ),
              onTap: (index) async {
                // c.seciliMenu.value = index;
                if (index == 0) {
                  c.selectedMenu.value = index;
                  BindingsBuilder.put(() => HomeBinding());
                  //
                } else if (index == 1) {
                  c.selectedMenu.value = index;
                } else if (index == 2) {
                  c.selectedMenu.value = index;
                } else if (index == 3) {
                  c.selectedMenu.value = index;
                }
              },
            ),
          ),
          // body: c.pages[c.selectedMenu.value],
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(animation),
                  child: ScaleTransition(
                    scale:
                        Tween<double>(begin: 0.9, end: 1.0).animate(animation),
                    child: child,
                  ),
                ),
              );
            },
            child: IndexedStack(
              key: ValueKey<int>(controller.selectedMenu.value),
              index: c.selectedMenu.value,
              children: c.pages,
            ),
          ),
        ),
      );
    });
  }
}
