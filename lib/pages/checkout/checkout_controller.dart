import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  // Adres Bilgileri
  final name = TextEditingController();
  final phone = TextEditingController();
  final country = TextEditingController();
  final city = TextEditingController();
  final town = TextEditingController();
  final postalCode = TextEditingController();

  // Kart Bilgileri
  final cardNumber = TextEditingController();
  final cardHolderName = TextEditingController();
  final cardExpiredDate = TextEditingController();
  final cardCvc = TextEditingController();

  var cardNumberText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    cardNumber.addListener(() {
      cardNumberText.value = cardNumber.text;
    });
  }

  @override
  void onClose() {
    cardNumber.dispose();
    super.onClose();
  }
}
