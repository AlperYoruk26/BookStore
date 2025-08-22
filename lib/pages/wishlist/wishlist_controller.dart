import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/wishlist_model.dart';
import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class WishlistController extends GetxController {
  final _storageService = Get.find<StorageService>();
  final _apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;
  final isInWishlist = Get.find<BookDetailsController>().isInWishlist;
  final books = <Wishlist>[].obs;

  @override
  void onInit() async {
    super.onInit();
    // final userId = await Supabase.instance.client.auth.currentUser?.id;
    // final language =
    //     await _storageService.getValue<String>(StorageConstants.appLanguage);
    // final selectedIndex = Get.find<MainController>().selectedIndex.value;
    // debugPrint('Index: $selectedIndex');
    // if (userId != null && language != null) {
    // }
    await getWishlist();
  }

  Future<void> getWishlist() async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final language =
          await _storageService.getValue<String>(StorageConstants.appLanguage);
      isLoading.value = true;
      final response = await _apiService.post(
          '${ApiConstants.baseUrl}/rpc/get_wishlist',
          data: {'p_user': userId, 'p_language': language});
      if (response.statusCode == 200) {
        final List data = response.data;
        books.value = data.map((e) => Wishlist.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error fetching wishlist: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteRemoveFromWishlist(int bookId) async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final response = await _apiService.delete(
          '${ApiConstants.baseUrl}/wishlist?user_id=eq.$userId&book_id=eq.$bookId');
      if (response.statusCode == 204) {
        isInWishlist.value = false;
      }
    } catch (e) {
      debugPrint('Error removing from wishlist: $e');
    }
  }
}
