import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/services/key.dart';

class SplashController extends GetxController {
  final storage = GetStorage();
  final changeView = false.obs;

  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 2));
    if (storage.read<bool>(StorageKey.LOG_IN) == false || storage.read<bool>(StorageKey.LOG_IN) == null) {
      changeView.value = true;
    } else {
      Get.offAndToNamed(Routes.NAVIGATOR_BAR);
    }
    super.onReady();
  }

  @override
  void onClose() {
    changeView.close();
    super.onClose();
  }
}
