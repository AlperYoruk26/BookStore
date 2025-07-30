import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await waitForService();
    await checkAndRedirect();
    // await checkLanguageSelected();
  }

  Future<void> waitForService() async {
    while (!(Get.isRegistered<StorageService>() &&
        Get.isRegistered<ApiService>() &&
        Get.isRegistered<AuthService>())) {
      await Future.delayed(Duration(seconds: 3));
    }
    // final storageService = Get.find<StorageService>();
    // await storageService.remove(StorageConstants.appLanguage);
    var map = Get.find<StorageService>().getAllValues();
    // debugPrint('Storage Values: $map');
  }

  Future<void> checkAndRedirect() async {
    final session = Supabase.instance.client.auth.currentSession;
    final storageService = Get.find<StorageService>();
    try {
      if (session != null) {
        Get.offAllNamed(AppRoutesConstants.HOME);
        // debugPrint('Current Session: ${JsonEncoder.withIndent(' ').convert(session.user.toJson())}');
        debugPrint('Access Token: ${session.accessToken}');
        return;
      }
    } catch (e) {
      debugPrint('Error checking session: $e');
    }

    try {
      final savedLanguage = await storageService.getValue<String>(StorageConstants.appLanguage);
      if (savedLanguage != null) {
        Get.updateLocale(Locale(savedLanguage));
        Get.offAllNamed(AppRoutesConstants.LOGIN);
      } else {
        Get.offAllNamed(AppRoutesConstants.LANGUAGE_SELECTOR);
      }
    } catch (e) {
      debugPrint('Error checking language selection: $e');
    }
  }
}
