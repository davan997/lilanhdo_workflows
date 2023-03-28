import 'package:get/get.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class OnboardingController extends GetxController {
  final currentIndex = 0.obs;
  final changeView = false.obs;
  final images = [
    {
      'image': R.ASSETS_IMAGES_ONBOADING_1_PNG,
      'content': 'Task,\nCalendar,\nChat',
    },
    {
      'image': R.ASSETS_IMAGES_ONBOADING_2_PNG,
      'content': 'Work\nAnywhere\nEasily',
    },
    {
      'image': R.ASSETS_IMAGES_ONBOARDING_3_PNG,
      'content': 'Manage\nEverything\non Phone',
    },
  ];

  @override
  void onClose() {
    super.onClose();
    changeView.close();
    currentIndex.close();
  }
}
