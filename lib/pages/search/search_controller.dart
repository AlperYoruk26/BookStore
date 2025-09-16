import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/search_books_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchbarController extends GetxController {
  final apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  final searchBooks = <SearchBooks>[].obs;

  Future<void> searchBooksByName(String searchText, String language) async {
    try {
      isLoading.value = true;
      final response = await apiService.post(
          '${ApiConstants.baseUrl}/rpc/search_books',
          data: {"search_text": searchText, "lang": language});
      if (response.statusCode == 200) {
        final List data = response.data;
        searchBooks.value = data.map((e) => SearchBooks.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Search data error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchBooksByAuthor(String author, String language) async {
    try {
      isLoading.value = true;
      final response = await apiService.post(
          '${ApiConstants.baseUrl}/rpc/search_books_by_author',
          data: {"author_name": author, "lang": language});
      if (response.statusCode == 200) {
        final List data = response.data;
        searchBooks.value = data.map((e) => SearchBooks.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Search data error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
