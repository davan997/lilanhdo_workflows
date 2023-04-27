import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/services/key.dart';

class SplashController extends GetxController {
  final changeView = false.obs;
  @override
  void onInit() async {
    super.onInit();
    final box = GetStorage();
    await Future.delayed(const Duration(seconds: 2));
    if (box.read(StorageKey.LOG_IN) == false || box.read(StorageKey.LOG_IN) == null) {
      changeView.value = true;
    } else {
      Get.offAndToNamed(Routes.NAVIGATOR_BAR);
    }
  }

  @override
  void onClose() {
    changeView.close();
    super.onClose();
  }
}
