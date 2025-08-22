import 'package:book_store/l10n/app_localizations.dart';
import 'package:book_store/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookTypes extends GetView<HomeController> {
  const BookTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!.localeName;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: controller.types.map((type) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text(type.name),
                  selected: controller.selectedTypeId.value == type.id,
                  selectedColor: Color(0xFFD45555),
                  labelStyle: TextStyle(color: Colors.white),
                  onSelected: (selected) async {
                    if (selected) {
                      await controller.getBooks(type.id);
                      controller.selectedTypeId.value = type.id;
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
