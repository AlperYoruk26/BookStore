import 'package:book_store/pages/book_details/book_details_controller.dart';
import 'package:book_store/pages/cart/cart_controller.dart';
import 'package:book_store/pages/category_details/category_details_controller.dart';
import 'package:book_store/pages/checkout/checkout_controller.dart';
import 'package:book_store/pages/home/home_controller.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/pages/main/main_controller.dart';
import 'package:book_store/pages/profile/profile_controller.dart';
import 'package:book_store/pages/settings/settings_controller.dart';
import 'package:book_store/pages/wishlist/wishlist_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController(), fenix: true);
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BookDetailsController());
    Get.lazyPut(() => CategoryDetailsController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => CheckoutController());
    Get.lazyPut(() => SettingsController());
  }
}
