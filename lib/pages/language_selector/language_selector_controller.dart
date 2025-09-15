import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/languages_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/language_model.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class LanguageSelectorController extends GetxController {
  final storageService = Get.find<StorageService>();

  var selectedLang = Rx<Language?>(languages[0]);

  @override
  void onInit() async {
    super.onInit();
    final language =
        await storageService.getValue<String>(StorageConstants.appLanguage);
    final foundLang = languages.firstWhere((lang) => lang.code == language,
        orElse: () => languages[0]);
    selectedLang.value = foundLang;
  }

  Future<void> save() async {
    try {
      await storageService.setValue(
          StorageConstants.appLanguage, selectedLang.value!.code);
      Get.offAllNamed(AppRoutesConstants.LOGIN);
    } catch (e) {
      debugPrint('Set appLanguage error: $e');
    }
  }

  Future<void> change() async {
    try {
      await storageService.setValue(
          StorageConstants.appLanguage, selectedLang.value!.code);
      Get.offAllNamed(AppRoutesConstants.MAIN);
    } catch (e) {
      debugPrint('Set appLanguage error: $e');
    }
  }
}
