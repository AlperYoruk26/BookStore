import 'package:book_store/pages/home/home_page.dart';
import 'package:book_store/pages/profile/profile_page.dart';
import 'package:book_store/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TabScreens {
  static List<PersistentTabConfig> tabs(BuildContext context) {
    return [
      PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
              icon: Icon(Icons.home),
              activeForegroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              inactiveBackgroundColor: Colors.grey)),
      PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
              icon: Icon(Icons.person),
              activeForegroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              inactiveBackgroundColor: Colors.grey)),
      PersistentTabConfig(
          screen: SettingsPage(),
          item: ItemConfig(
              icon: Icon(Icons.settings),
              activeForegroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              inactiveBackgroundColor: Colors.grey)),
    ];
  }
}
