import 'package:book_store/core/constants/app_routes_constant.dart';
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
    await checkTokenAndRedirect();
  }

  Future<void> waitForService() async {
    while (!Get.isRegistered<StorageService>() &&
        !Get.isRegistered<ApiService>() &&
        !Get.isRegistered<AuthService>()) {
      await Future.delayed(Duration(seconds: 3));
    }

    // final storageService = Get.find<StorageService>();
    // await storageService.remove(StorageConstants.userToken);
    var map = Get.find<StorageService>().getAllValues();
    // debugPrint('Storage Values: $map');
  }

  Future<void> checkTokenAndRedirect() async {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      Get.offAllNamed(AppRoutesConstants.HOME);
      // debugPrint('Current Session: ${JsonEncoder.withIndent(' ').convert(session.user.toJson())}');
      debugPrint('Access Token: ${session.accessToken}');
    } else {
      debugPrint('No active session found, redirecting to login.');
      Get.offAllNamed(AppRoutesConstants.LOGIN);
    }
  }
}
