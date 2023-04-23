import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/create_task_controller.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTaskController>(
      init: CreateTaskController(),
      builder: (controller) {
        return Wrap(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(R.ASSETS_ICONS_IC_PROJECT_TWO_SVG),
                      const SizedBox(width: 16),
                      DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton2(
                            value: controller.selectTask.value,
                            style: StyleText.inter13Bold,
                            isDense: true,
                            iconStyleData: IconStyleData(
                              icon: SvgPicture.asset(R.ASSETS_ICONS_IC_SMALL_DOWN_2_SVG),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              width: 210,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(14),
                                ),
                                color: AppColors.background2,
                              ),
                            ),
                            items: controller.lTask.map(
                              (d) {
                                return DropdownMenuItem(
                                  value: d,
                                  child: Text(d),
                                );
                              },
                            ).toList(),
                            onChanged: (d) {
                              controller.selectTask.value = d!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: AppGradient.gradient_3,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 2,
                        margin: const EdgeInsets.only(left: 16, right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.editTaskName,
                          onChanged: (d) {
                            controller.contentTaskNam.value = d;
                          },
                          decoration: inputDecoration(
                            hintText: 'Task name...',
                            isBorderBottom: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5VR-CsQOdsfLUPt58rAAGLiq9tOwnh2krgcmSLc1rKA&s',
                                  height: 48,
                                  width: 48,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Assigned to',
                                    style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                                  ),
                                  const SizedBox(height: 6),
                                  Text('Derek Doyle', style: StyleText.interW600, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: AppGradient.gradient_4,
                                ),
                                child: SvgPicture.asset(R.ASSETS_ICONS_IC_CALENDAR_WHITE_SVG),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Due Date',
                                    style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Today ${DateFormat('ha').format(DateTime.now())}',
                                    style: StyleText.interW600.copyWith(color: AppColors.colorFul5),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Row(
                        children: controller.lOption.map(
                          (d) {
                            final index = controller.lOption.indexOf(d);
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 0 : 16, right: index == controller.lOption.length - 1 ? 0 : 16),
                              child: GestureDetector(
                                onTap: () {
                                  d['function'];
                                },
                                child: SvgPicture.asset(d['icon']),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(15.6),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 8),
                              blurRadius: 12,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(R.ASSETS_ICONS_IC_PLUS_SVG),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
