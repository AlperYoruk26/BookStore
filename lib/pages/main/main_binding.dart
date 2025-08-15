import 'package:book_store/pages/home/home_controller.dart';
import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:book_store/pages/main/main_controller.dart';
import 'package:book_store/pages/profile/profile_controller.dart';
import 'package:book_store/pages/settings/settings_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => LoadingController(), fenix: true);
  }
}
