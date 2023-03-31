import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/create_workspace/controllers/create_workspace_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key, required this.controller});

  final CreateWorkspaceController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(40)),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: getHeight(112),
            width: getWidth(112),
            padding: EdgeInsets.only(
              left: getWidth(27.71),
              top: getHeight(13.1),
              right: getWidth(9.59),
              bottom: getHeight(8),
            ),
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colorFul1),
            child: Image.asset(R.ASSETS_IMAGES_AVATAR_DEFAULT_TEST_PNG),
          ),
        ),
        SizedBox(height: getHeight(16)),
        Text(
          'Stuart’s Workspace',
          style: StyleText.poppins24w600,
        ),
        SizedBox(height: getHeight(8)),
        Text(
          'Tap the logo to upload new logo',
          style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
        ),
        SizedBox(height: getHeight(32)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'how many people in your team'.toUpperCase(),
              style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
            ),
            SizedBox(height: getHeight(20)),
            Row(
              children: [
                SizedBox(width: getWidth(16)),
                Text('11 - 25', style: StyleText.inter16w600),
                const Spacer(),
                SvgPicture.asset(R.ASSETS_ICONS_IC_GROUP_SVG),
                SizedBox(width: getWidth(16)),
              ],
            ),
            SizedBox(height: getHeight(36)),
            Text(
              'invite people to your workspace'.toUpperCase(),
              style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
            ),
            SizedBox(height: getHeight(20)),
            Row(
              children: [
                SizedBox(width: getWidth(16)),
                Text(
                  'Email Address',
                  style: StyleText.interBold.copyWith(color: AppColors.primary),
                ),
                const Spacer(),
                SvgPicture.asset(R.ASSETS_ICONS_IC_PLUS_SVG, height: getHeight(16), width: getWidth(16)),
                SizedBox(width: getWidth(16)),
              ],
            ),
            SizedBox(height: getHeight(36)),
            Text(
              'Choose color theme'.toUpperCase(),
              style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
            ),
            SizedBox(height: getHeight(31)),
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
                        margin: EdgeInsets.symmetric(horizontal: getWidth(5.8), vertical: getHeight(4)),
                        padding: EdgeInsets.symmetric(
                          horizontal: getWidth(16),
                          vertical: getHeight(16),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: controller.currentTheme.value == index ? AppColors.primary : AppColors.background,
                          ),
                          borderRadius: BorderRadius.circular(
                            getBorderRadius(12),
                          ),
                        ),
                        child: Container(
                          height: getHeight(16),
                          width: getWidth(16),
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
            SizedBox(height: getHeight(17)),
            Row(
              children: [
                Expanded(
                  child: Expanded(
                    child: ButtonDefault(
                      isTextButton: true,
                      onPressed: () {},
                      title: 'Skip',
                    ),
                  ),
                ),
                SizedBox(width: getWidth(131)),
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
      ],
    );
  }
}
