import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/pages/home/home_controller.dart';
import 'package:book_store/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Searchbar extends GetView<HomeController> {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        // height: MediaQuery.of(context).size.width * 0.1,
        child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            controller: controller.search,
            decoration: InputDecoration(
              // isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 2),
              prefixIcon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            onEditingComplete: () => pushScreen(
                  context,
                  screen: SearchPage(),
                  withNavBar: true,
                  settings:
                      RouteSettings(name: AppRoutesConstants.SEARCH, arguments: {
                    'search_text': controller.search.text,
                    'lang': Get.locale?.languageCode,
                    'page': AppRoutesConstants.HOME
                  }),
                )));
  }
}
