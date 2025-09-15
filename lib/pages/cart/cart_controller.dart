import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/cart_model.dart';
import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class CartController extends GetxController {
  final storageService = Get.find<StorageService>();
  final apiService = Get.find<ApiService>();
  final isLoading = Get.find<LoadingController>().isLoading;
  final isInCart = Get.find<BookDetailsController>().isInCart;

  final books = <Cart>[].obs;
  final itemCount = <int, int>{}.obs;

  @override
  void onInit() async {
    super.onInit();
    await getCart();
  }

  void increments(int bookId) {
    if (itemCount[bookId]! < 10) {
      itemCount[bookId] = (itemCount[bookId] ?? 0) + 1;
    }
  }

  void decrements(int bookId) {
    if (itemCount[bookId]! > 1) {
      itemCount[bookId] = (itemCount[bookId] ?? 0) - 1;
    }
  }

  Future<void> getCart() async {
    try {
      final userId = await Supabase.instance.client.auth.currentUser?.id;
      final language =
          await storageService.getValue<String>(StorageConstants.appLanguage);
      isLoading.value = true;
      final response = await apiService.post('${ApiConstants.baseUrl}/rpc/get_cart',
          data: {'p_user': userId, 'p_language': language});
      if (response.statusCode == 200) {
        final List data = response.data;
        books.value = data.map((e) => Cart.fromJson(e)).toList();
        for (final book in books) {
          itemCount.putIfAbsent(book.bookId, () => 1);
        }
      }
    } catch (e) {
      debugPrint('Error fetching cart: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteRemoveFromCart(int id) async {
    try {
      final response =
          await apiService.delete('${ApiConstants.baseUrl}/cart?id=eq.$id');
      if (response.statusCode == 204) {
        isInCart.value = false;
      }
    } catch (e) {
      debugPrint('Error remove from cart: $e');
    }
  }
}
