import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/create_workspace/controllers/create_workspace_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key, required this.controller});

  final CreateWorkspaceController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 112,
            width: 112,
            padding: const EdgeInsets.fromLTRB(27.71, 13.1, 9.59, 8),
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colorFul1),
            child: Image.asset(R.ASSETS_IMAGES_AVATAR_DEFAULT_TEST_PNG),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Stuart’s Workspace',
          style: StyleText.poppins24w600,
        ),
        const SizedBox(height: 8),
        Text(
          'Tap the logo to upload new logo',
          style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'how many people in your team'.toUpperCase(),
                style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text('11 - 25', style: StyleText.inter16w600),
                  const Spacer(),
                  SvgPicture.asset(R.ASSETS_ICONS_IC_GROUP_SVG),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 36),
              Text(
                'invite people to your workspace'.toUpperCase(),
                style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    'Email Address',
                    style: StyleText.interBold.copyWith(color: AppColors.primary),
                  ),
                  const Spacer(),
                  SvgPicture.asset(R.ASSETS_ICONS_IC_PLUS_SVG, height: 16, width: 16),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 36),
              Text(
                'Choose color theme'.toUpperCase(),
                style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
              ),
              const SizedBox(height: 31),
              Wrap(
                children: controller.lTheme.map(
                  (d) {
                    final index = controller.lTheme.indexOf(d);
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        controller.currentTheme.value = index;
                      },
                      child: Obx(
                        () => Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(14.2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: controller.currentTheme.value == index ? AppColors.primary : AppColors.background,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: index < 7 ? d : null,
                              color: index > 6 ? d : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  Expanded(
                    child: ButtonDefault(
                      isTextButton: true,
                      onPressed: () {},
                      title: 'Skip',
                    ),
                  ),
                  const SizedBox(width: 131),
                  Expanded(
                    child: ButtonDefault(
                      onPressed: () {
                        controller.isChangeView.value = !controller.isChangeView.value;
                      },
                      title: 'Next',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
