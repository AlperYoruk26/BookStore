import 'package:book_store/core/constants/screen_contant.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(context,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          decoration: NavBarDecoration(
            border: Border(
                top:
                    BorderSide(color: Theme.of(context).navigationBarTheme.shadowColor!, width: 1)),
          ),
          screens: TabScreens.screens,
          items: TabScreens.items(context)),
    );
  }
}
