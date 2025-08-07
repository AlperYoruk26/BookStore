import 'package:book_store/pages/category_details/category_details_controller.dart';
import 'package:get/get.dart';

class CategoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDetailsController());
  }
}
