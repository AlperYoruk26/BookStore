import 'package:book_store/core/constants/screen_contants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: TabScreens.tabs(context),
        navBarBuilder: (p0) => Style6BottomNavBar(
          navBarConfig: p0,
          navBarDecoration: NavBarDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).navigationBarTheme.shadowColor!, width: 1))),
        ),
      ),
    );
  }
}
