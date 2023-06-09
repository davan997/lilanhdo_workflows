import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lilanhdo_workflows/app/component/app_bar_default.dart';
import 'package:lilanhdo_workflows/app/modules/create_workspace/views/widget/step_one.dart';
import 'package:lilanhdo_workflows/app/modules/create_workspace/views/widget/step_two.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/create_workspace_controller.dart';

class CreateWorkspaceView extends GetView<CreateWorkspaceController> {
  const CreateWorkspaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          AppBarDefault(
            leading: true,
            title: 'New Workspace',
            actions: [
              SvgPicture.asset(
                R.ASSETS_ICONS_IC_UNKNOWN_SVG,
                height: 48,
                width: 48,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: GradientBoxBorder(
                  width: 3,
                  gradient: LinearGradient(
                    stops: const [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      AppColors.background,
                    ],
                  ),
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Obx(
                () => controller.isChangeView.value == false
                    ? StepOne(controller: controller)
                    : StepTwo(controller: controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
