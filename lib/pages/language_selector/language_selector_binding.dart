import 'package:book_store/pages/language_selector/language_selector_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LanguageSelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageSelectorController());
  }
}
