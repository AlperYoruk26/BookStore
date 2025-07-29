import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final authService = Get.find<AuthService>();

  var visiblePassword = false.obs;
  var visibleConfirmPassword = false.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> submitForm() async {
    debugPrint(
        'FirstName: ${firstNameController.text} LastName: ${lastNameController.text} Email: ${emailController.text} Password: ${passwordController.text} ConfirmPassword: ${confirmPasswordController.text}');
    try {
      await authService.createAccount(emailController.text, passwordController.text,
          firstNameController.text, lastNameController.text);
      Get.snackbar('Kayıt Başarılı', '');
      Get.offAllNamed(AppRoutesConstants.LOGIN);
    } catch (e) {
      Get.snackbar('Kayıt Hatası', 'Email veya şifreler hatalı: $e');
    }
  }
}
