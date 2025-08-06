import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/languages_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/language_model.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class LanguageSelectorController extends GetxController {
  final _storageService = Get.find<StorageService>();

  var selectedLang = Rx<Language?>(languages[0]);

  Future<void> save() async {
    try {
      await _storageService.setValue(StorageConstants.appLanguage, selectedLang.value!.code);
      Get.offAllNamed(AppRoutesConstants.LOGIN);
    } catch (e) {
      debugPrint('Set appLanguage error: $e');
    }
  }

  Future<void> change() async {
    try {
      await _storageService.setValue(StorageConstants.appLanguage, selectedLang.value!.code);
      Get.offAllNamed(AppRoutesConstants.MAIN);
    } catch (e) {
      debugPrint('Set appLanguage error: $e');
    }
  }
}
