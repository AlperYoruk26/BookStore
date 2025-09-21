import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/addresses/addresses_page.dart';
import 'package:book_store/pages/cards/cards_page.dart';
import 'package:book_store/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.app_settings,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                // color: const Color.fromARGB(255, 249, 249, 249),
                elevation: 4,
                child: ListTile(
                  title: Text(local.language),
                  textColor: Theme.of(context).colorScheme.onSecondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10)),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  onTap: () => Get.toNamed(AppRoutesConstants.LANGUAGE_SELECTOR,
                      arguments: true),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                elevation: 4,
                child: SwitchListTile(
                  title: Text(local.theme,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10)),
                  value: Get.isDarkMode,
                  onChanged: (value) => controller.toggleTheme(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                local.account_settings,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                // color: const Color.fromARGB(255, 249, 249, 249),
                elevation: 4,
                child: ListTile(
                    title: Text(local.cards),
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    onTap: () => pushScreen(context,
                        screen: const CardsPage(),
                        withNavBar: true,
                        settings: RouteSettings(arguments: {
                          'user_id': Supabase.instance.client.auth.currentUser?.id
                        }))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                // color: const Color.fromARGB(255, 249, 249, 249),
                elevation: 4,
                child: ListTile(
                    title: Text(local.addresses),
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    onTap: () => pushScreen(context,
                        screen: const AddressesPage(),
                        withNavBar: true,
                        settings: RouteSettings(arguments: {
                          'user_id': Supabase.instance.client.auth.currentUser?.id
                        }))),
              ),
            ],
          ),
        ));
  }
}
