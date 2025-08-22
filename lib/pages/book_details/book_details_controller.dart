import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class BookDetailsController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  final book = Rx<Books?>(null);
  final isInWishlist = false.obs;

  Future<void> loadBook(int bookId, String lang) async {
    try {
      isLoading.value = true;
      final response = await _apiService.post('${ApiConstants.baseUrl}/rpc/get_book_by_id',
          data: {"book_id": bookId, "lang": lang});
      if (response.statusCode == 200) {
        book.value = Books.fromJson(response.data);
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint('Error load book $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postIsInWishlst(int bookId) async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final response = await _apiService.post('${ApiConstants.baseUrl}/rpc/is_in_wishlist',
          data: {"userid": userId, "bookid": bookId});
      if (response.statusCode == 200) {
        isInWishlist.value = response.data ?? false;
        // debugPrint('Is in wishlist: ${isInWishlist.value.toString()}');
      }
    } catch (e) {
      debugPrint('Error checking wishlist: $e');
    }
  }

  Future<void> postAddToWishlist(int bookId) async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final response = await _apiService.post('${ApiConstants.baseUrl}/rpc/add_to_wishlist',
          data: {"userid": userId, "bookid": book.value?.id});
      if (response.statusCode == 200) {
        // debugPrint('Added to wishlist: ${response.data}');
        isInWishlist.value = true;
      }
    } catch (e) {
      debugPrint('Error adding to wishlist: $e');
    }
  }

  Future<void> deleteRemoveFromWishlist(int bookId) async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final response = await _apiService
          .delete('${ApiConstants.baseUrl}/wishlist?user_id=eq.$userId&book_id=eq.$bookId');
      if (response.statusCode == 204) {
        isInWishlist.value = false;
      }
    } catch (e) {
      debugPrint('Error removing from wishlist: $e');
    }
  }
}
