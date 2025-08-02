import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/models/categories.dart';
import 'package:book_store/models/types.dart';
import 'package:book_store/pages/splash/splash_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final _storageService = Get.find<StorageService>();
  final isLoading = Get.find<SplashController>().isLoading;

  var types = <Types>[].obs;
  var categories = <Categories>[].obs;
  var books = <Books>[].obs;
  var selectedTypeIndex = 1.obs;
  var selectedTypeId = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    final language = await _storageService.getValue<String>(StorageConstants.appLanguage);
    debugPrint('Lang: $language');
    await getTypes();
    await getCategories();
    await getBooks(language!, selectedTypeId.value);
    isLoading.value = false;
  }

  Future<void> getTypes() async {
    try {
      final lang = await _storageService.getValue<String>(StorageConstants.appLanguage);
      debugPrint('Lang: $lang');
      final response = await _apiService.post(
          'https://jandsidgrocwzsckmqqx.supabase.co/rest/v1/rpc/get_types',
          data: {"lang": lang});
      if (response.statusCode == 200) {
        final List data = response.data;
        types.value = data.map((e) => Types.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Get types error: $e');
    }
  }

  Future<void> getCategories() async {
    try {
      final lang = await _storageService.getValue<String>(StorageConstants.appLanguage);
      final response = await _apiService.post(
          'https://jandsidgrocwzsckmqqx.supabase.co/rest/v1/rpc/get_categories',
          data: {"lang": lang});
      if (response.statusCode == 200) {
        final List data = response.data;
        categories.value = data.map((e) => Categories.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Get types error: $e');
    }
  }

  Future<void> getBooks(String language, int typeId) async {
    try {
      final response = await _apiService.post(
          'https://jandsidgrocwzsckmqqx.supabase.co/rest/v1/rpc/get_books',
          data: {"lang": language, "filter_type_id": typeId});
      if (response.statusCode == 200) {
        final List data = response.data;
        books.value = data.map((e) => Books.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Get types error: $e');
    }
  }
}
