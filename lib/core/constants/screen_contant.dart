import 'package:book_store/pages/home/home_page.dart';
import 'package:book_store/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class TabScreens {
  static final List<Widget> screens = [
    HomePage(),
    ProfilePage(),
  ];

  static List<PersistentBottomNavBarItem> items(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
