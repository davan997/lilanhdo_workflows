import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class CreateWorkspaceController extends GetxController {
  final currentPlan = 0.obs;
  final currentTheme = 0.obs;
  final isChangeView = false.obs;
  final lPlan = [
    {
      'title': 'It’s Free',
      'content': 'For team\nfrom 1 - 5',
    },
    {
      'title': 'Premium',
      'content': '\$19/mo',
    },
  ];
  final lFeatures = <dynamic>[
    {
      'icon': R.ASSETS_ICONS_IC_MULTI_USER_SVG,
      'title': 'Multiple Assignees',
      'switch': false.obs,
    },
    {
      'icon': R.ASSETS_ICONS_IC_CIRCLE_WRAP_SVG,
      'title': 'Custom Labels',
      'switch': false.obs,
    },
  ];
  final lTheme = <dynamic>[
    AppGradient.gradient_1,
    AppGradient.gradient_3,
    AppGradient.gradient_4,
    AppGradient.gradient_5,
    AppGradient.gradient_7,
    AppGradient.gradient_8,
    AppGradient.gradient_9,
    AppColors.colorFul2,
    AppColors.colorFul3,
    AppColors.background2,
  ];
}
