import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/cards_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardsController extends GetxController {
  final apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  final cards = <Cards>[].obs;

  final cardNumber = TextEditingController();
  final cardHolderName = TextEditingController();
  final cardExpiredDate = TextEditingController();

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

  Future<void> getCards(String userId) async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
          '${ApiConstants.baseUrl}/cards?user_id=eq.$userId&order=is_primary.desc');
      if (response.statusCode == 200) {
        final List data = response.data;
        cards.value = data.map((e) => Cards.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error get cards');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCard(int id) async {
    try {
      await apiService.patch('${ApiConstants.baseUrl}/cards?id=eq.$id', data: {
        'card_holder_name': cardHolderName.text,
        'card_number': cardNumber.text,
        'card_expired_date': cardExpiredDate.text
      });
    } catch (e) {
      debugPrint('Error Update Card: $e');
    }
  }

  Future<void> addCard(String userId) async {
    try {
      await apiService.post('${ApiConstants.baseUrl}/rpc/add_card', data: {
        'p_user_id': userId,
        'p_card_holder_name': cardHolderName.text,
        'p_card_number': cardNumber.text,
        'p_card_expired_date': cardExpiredDate.text
      });
    } catch (e) {
      debugPrint('Error Add Card: $e');
    }
  }

  Future<void> setPrimaryCard(String userId, int id) async {
    try {
      await apiService.post('${ApiConstants.baseUrl}/rpc/set_primary_card', data: {
        'p_user_id': userId,
        'p_id': id,
      });
    } catch (e) {
      debugPrint('Error Add Card: $e');
    }
  }

  Future<void> deleteCard(int id) async {
    try {
      await apiService.delete('${ApiConstants.baseUrl}/cards?id=eq.$id');
    } catch (e) {
      debugPrint('Error Delete Card: $e');
    }
  }

  void loadCardInfo(String name, String number, expired) {
    cardHolderName.text = name;
    cardNumber.text =
        MaskTextInputFormatter(mask: '#### #### #### ####').maskText(number);
    cardNumberText.value = cardNumber.text;
    cardExpiredDate.text = expired;
  }
}
