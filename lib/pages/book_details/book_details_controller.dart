import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController {
  final _apiService = Get.find<ApiService>();

  final book = Rx<Books?>(null);
  final isTouched = false.obs;

  Future<void> loadBook(int bookId, String lang) async {
    try {
      final response = await _apiService.post('${ApiConstants.baseUrl}/rpc/get_book_by_id',
          data: {"book_id": bookId, "lang": lang});

      book.value = Books.fromJson(response.data);
      debugPrint(response.data);
    } catch (e) {
      debugPrint('Error load book $e');
    }
  }
}
