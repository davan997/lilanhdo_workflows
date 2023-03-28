import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/services/key.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 2));
    if (storage.read<bool>(StorageKey.READ_SPLASH) == false || storage.read<bool>(StorageKey.READ_SPLASH) == null) {
      Get.offAndToNamed(Routes.ONBOARDING);
    } else {
      Get.offAndToNamed(Routes.NAVIGATOR_BAR);
    }
    super.onReady();
  }
}
