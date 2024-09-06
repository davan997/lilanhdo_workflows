import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/search/views/widget/task.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<SearchsController>(
        init: SearchsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: AppColors.background2,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(R.ASSETS_ICONS_IC_SEARCH_FULL_SVG),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: SizedBox(
                                    height: 25,
                                    child: TextFormField(
                                      autovalidateMode: AutovalidateMode.always,
                                      controller: controller.controllerSearch,
                                      style: StyleText.interBold,
                                      onFieldSubmitted: (d) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      maxLines: 1,
                                      onTap: () {
                                        controller.isFocusSearch.value = true;
                                      },
                                      onChanged: (d) {
                                        controller.contentSearch.value = d;
                                      },
                                      decoration: inputDecoration(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                if (controller.contentSearch.value != '')
                                  InkWell(
                                    onTap: () {
                                      controller.controllerSearch.text = '';
                                      controller.contentSearch.value = '';
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: AppColors.background,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(R.ASSETS_ICONS_IC_CLOSE_SVG),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.isFocusSearch.value == true)
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  controller.controllerSearch.text = '';
                                  controller.contentSearch.value = '';
                                  controller.isFocusSearch.value = false;
                                  FocusScope.of(context).unfocus();
                                },
                                child: Text(
                                  'Cancel',
                                  style: StyleText.inter16w600.copyWith(color: AppColors.deActive),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: controller.lTab.map(
                      (d) {
                        final index = controller.lTab.indexOf(d);
                        return GestureDetector(
                          onTap: () {
                            controller.currentIndex.value = index;
                          },
                          child: Obx(
                            () => Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: controller.currentIndex.value == index ? AppColors.primary : null,
                              ),
                              child: Text(
                                d,
                                style: StyleText.interBold.copyWith(
                                  color: controller.currentIndex.value == index ? Colors.white : AppColors.deActive,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Obx(
                      () => ListView(
                        children: controller.lData.map(
                          (d) {
                            return Task(item: d, controller: controller);
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
