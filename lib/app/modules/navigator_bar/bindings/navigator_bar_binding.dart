import 'package:get/get.dart';

import '../controllers/navigator_bar_controller.dart';

class NavigatorBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorBarController>(
      () => NavigatorBarController(),
    );
  }
}
