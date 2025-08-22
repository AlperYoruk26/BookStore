import 'package:book_store/core/constants/screen_contants.dart';
import 'package:book_store/pages/main/main_controller.dart';
import 'package:book_store/components/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller:
            PersistentTabController(initialIndex: controller.selectedIndex.value),
        tabs: TabScreens.tabs(context),
        navBarBuilder: (p0) => CustomNavBar(navBarConfig: p0),
        // navBarBuilder: (p0) => Style6BottomNavBar(
        //   navBarConfig: p0,
        //   navBarDecoration: NavBarDecoration(
        //       color: Theme.of(context).scaffoldBackgroundColor,
        //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        //       border: Border(
        //           top: BorderSide(
        //               color: Theme.of(context).navigationBarTheme.shadowColor!, width: 1))),
        // ),
      ),
    );
  }
}
