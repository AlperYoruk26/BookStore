import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await waitForService();
    await checkAndRedirect();
  }

  Future<void> waitForService() async {
    while (!(Get.isRegistered<StorageService>() &&
        Get.isRegistered<ApiService>() &&
        Get.isRegistered<AuthService>())) {
      await Future.delayed(Duration(seconds: 3));
    }
    final storageService = Get.find<StorageService>();
    // await storageService.remove(StorageConstants.appLanguage);
    // await storageService.remove(StorageConstants.userToken);
    final token = storageService.getValue<String>(StorageConstants.userToken);
    // var map = Get.find<StorageService>().getAllValues();
    debugPrint('Token: $token');
  }

  Future<void> checkAndRedirect() async {
    final storageService = Get.find<StorageService>();
    await Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      try {
        if (session != null) {
          await storageService.setValue(StorageConstants.userToken, session.accessToken);
          Get.offAllNamed(AppRoutesConstants.MAIN);
          // debugPrint('Current Session: ${JsonEncoder.withIndent(' ').convert(session.user.toJson())}');
          // debugPrint('Access Token: ${session.accessToken}');
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
    });
  }
}
