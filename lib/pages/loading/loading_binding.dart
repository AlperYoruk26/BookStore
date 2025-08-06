import 'package:book_store/pages/loading/loading_controller.dart';
import 'package:get/instance_manager.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController());
  }
}
