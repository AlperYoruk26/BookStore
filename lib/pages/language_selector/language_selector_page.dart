import 'package:book_store/core/constants/languages_constant.dart';
import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/models/language_model.dart';
import 'package:book_store/pages/language_selector/language_selector_controller.dart';
import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectorPage extends GetView<LanguageSelectorController> {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fromSettings = Get.arguments ?? false;
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: fromSettings ? AppBar() : null,
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        local.languageSelectionTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Color(0xFF111111)
                                : Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton2<Language>(
                          value: controller.selectedLang.value,
                          onChanged: (Language? value) {
                            controller.selectedLang.value = value!;
                            Get.updateLocale(
                                Locale(controller.selectedLang.value!.code));
                          },
                          barrierColor: const Color.fromARGB(100, 0, 0, 0),
                          iconStyleData:
                              IconStyleData(openMenuIcon: Icon(Icons.arrow_drop_up)),
                          dropdownStyleData: DropdownStyleData(
                              offset: Offset(0, -10),
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Color(0xFF111111)
                                      : Color(0xFFEEEEEE),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          underline: SizedBox(),
                          items: languages.map((lang) {
                            return DropdownMenuItem<Language>(
                              value: lang,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 0),
                                child: Row(
                                  children: [
                                    CountryFlag.fromLanguageCode(
                                      lang.code,
                                      shape: RoundedRectangle(5),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      lang.name,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              fromSettings ? controller.change() : controller.save(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary),
                          child: Text(fromSettings ? local.change : local.save)),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
