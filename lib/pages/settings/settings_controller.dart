import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/core/constants/theme_constant.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final _storageService = Get.find<StorageService>();

  final theme = ThemeConstants.light.obs;

  Future<void> toggleTheme() async {
    theme.value = Get.isDarkMode ? ThemeConstants.dark : ThemeConstants.light;
    Get.changeThemeMode(theme.value == ThemeConstants.dark ? ThemeMode.light : ThemeMode.dark);
    await _storageService.setValue(StorageConstants.appTheme, theme.value.toString());
  }
}
