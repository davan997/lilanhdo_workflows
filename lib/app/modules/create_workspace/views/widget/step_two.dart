import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/component/custom_switch.dart';
import 'package:lilanhdo_workflows/app/modules/create_workspace/controllers/create_workspace_controller.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key, required this.controller});

  final CreateWorkspaceController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getHeight(24)),
        Text(
          'Choose Plan',
          style: StyleText.poppins24w600,
        ),
        SizedBox(height: getHeight(8)),
        Text(
          'Unlock all features with Premium Plan',
          style: StyleText.inter12w500,
        ),
        SizedBox(height: getHeight(29)),
        Row(
          children: controller.lPlan.map(
            (d) {
              final index = controller.lPlan.indexOf(d);
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.currentPlan.value = index;
                  },
                  child: Obx(
                    () => Container(
                      height: getHeight(195),
                      margin: EdgeInsets.only(
                        right: index == 0 ? getWidth(10) : 0,
                        left: index == controller.lPlan.length - 1 ? getWidth(10) : 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getBorderRadius(20)),
                        border: GradientBoxBorder(
                          width: 4,
                          gradient: AppGradient.gradient_1,
                        ),
                        gradient: controller.currentPlan.value == index ? AppGradient.gradient_1 : null,
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          if (controller.currentPlan.value == index)
                            Positioned(
                              left: getWidth(2),
                              child: Container(
                                height: getHeight(40),
                                width: getWidth(40),
                                padding: EdgeInsets.symmetric(horizontal: getWidth(6), vertical: getHeight(6)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 8),
                                  gradient: AppGradient.gradient_4,
                                ),
                                child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG,
                                    fit: BoxFit.scaleDown, color: Colors.white),
                              ),
                            ),
                          if (controller.currentPlan.value == index)
                            Positioned(
                              top: getHeight(36),
                              child: Text('🎉', style: StyleText.poppins36w600),
                            ),
                          Positioned(
                            top: getHeight(98),
                            child: Text(
                              d['title']!,
                              style: StyleText.poppins18w600.copyWith(
                                color: controller.currentPlan.value == index ? AppColors.lightModeActive : Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: getHeight(130),
                            child: Text(
                              d['content']!,
                              style: StyleText.inter13.copyWith(
                                color: controller.currentPlan.value == index
                                    ? AppColors.lightModeActive
                                    : AppColors.colorFul2,
                                fontWeight: controller.currentPlan.value != index ? FontWeight.bold : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        SizedBox(height: getHeight(44)),
        Text('Enable Features', style: StyleText.poppins24w600),
        SizedBox(height: getHeight(8)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'You can customize the features in your workspace now. Or you can do it later in ',
                style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
              ),
              TextSpan(
                text: 'Menu – Workspace',
                style: StyleText.inter12w500,
              ),
              TextSpan(
                text: '.',
                style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
              ),
            ],
          ),
        ),
        SizedBox(height: getHeight(25)),
        Column(
          children: controller.lFeatures.map(
            (d) {
              return Container(
                margin: EdgeInsets.only(top: getHeight(9)),
                padding: EdgeInsets.symmetric(vertical: getHeight(15)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.background2),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(d['icon']),
                    SizedBox(width: getWidth(16)),
                    Text(d['title'], style: StyleText.inter16w600),
                    const Spacer(),
                    CustomSwitch(value: d['switch']),
                  ],
                ),
              );
            },
          ).toList(),
        ),
        SizedBox(height: getHeight(50)),
        Row(
          children: [
            Expanded(
              child: ButtonDefault(
                isTextButton: true,
                onPressed: () {
                  controller.isChangeView.value = !controller.isChangeView.value;
                },
                title: 'Back',
              ),
            ),
            SizedBox(width: getWidth(131)),
            Expanded(
              child: ButtonDefault(
                onPressed: () {
                  Get.toNamed(Routes.NAVIGATOR_BAR);
                },
                title: 'Done',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
