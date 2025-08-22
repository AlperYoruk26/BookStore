import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  final books = <Books>[].obs;

  Future<void> getBooks(int typeId, int categoryId, String language) async {
    try {
      isLoading.value = true;
      final response = await _apiService.post('${ApiConstants.baseUrl}/rpc/get_books_by_category',
          data: {"lang": language, "filter_type_id": typeId, "filter_category_id": categoryId});
      if (response.statusCode == 200) {
        final List data = response.data;
        books.value = data.map((e) => Books.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error get books: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
