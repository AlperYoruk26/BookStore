import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/models/categories_model.dart';
import 'package:book_store/models/types_model.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/services/api_service.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _apiService = Get.find<ApiService>();
  final _storageService = Get.find<StorageService>();
  final isLoading = Get.find<LoadingController>().isLoading;

  var types = <Types>[].obs;
  var categories = <Categories>[].obs;
  var books = <Books>[].obs;
  var selectedTypeIndex = 1.obs;
  var selectedTypeId = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    // isLoading.value = true;
    // final language =
    //     await _storageService.getValue<String>(StorageConstants.appLanguage);
    await loadPageData();
    // isLoading.value = false;
  }

  Future<void> loadPageData() async {
    try {
      isLoading.value = true;
      await getTypes();
      await getCategories();
      await getBooks(selectedTypeId.value);
    } catch (e) {
      debugPrint('Load page data error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTypes() async {
    try {
      final lang =
          await _storageService.getValue<String>(StorageConstants.appLanguage);
      final response = await _apiService
          .post('${ApiConstants.baseUrl}/rpc/get_types', data: {"lang": lang});
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
      final lang =
          await _storageService.getValue<String>(StorageConstants.appLanguage);
      final response = await _apiService
          .post('${ApiConstants.baseUrl}/rpc/get_categories', data: {"lang": lang});
      if (response.statusCode == 200) {
        final List data = response.data;
        categories.value = data.map((e) => Categories.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Get types error: $e');
    }
  }

  Future<void> getBooks(int typeId) async {
    try {
      final language =
          await _storageService.getValue<String>(StorageConstants.appLanguage);
      final response = await _apiService.post(
          '${ApiConstants.baseUrl}/rpc/get_books',
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
