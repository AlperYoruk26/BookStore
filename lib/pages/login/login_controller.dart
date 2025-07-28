import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final authService = Get.find<AuthService>();

  var email = ''.obs;
  var password = ''.obs;
  var visiblePassword = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> submitForm() async {
    debugPrint('Email: ${email.value}, Password: ${password.value}');
    try {
      final user = await authService.login(email.value, password.value);
      Get.snackbar('Giriş Başarılı', 'Hoş geldiniz, ${user.email}');
      Get.offAllNamed(AppRoutesConstants.HOME);
    } catch (e) {
      Get.snackbar('Giriş Hatası', 'Email veya şifre hatalı: $e');
    }
  }
}
