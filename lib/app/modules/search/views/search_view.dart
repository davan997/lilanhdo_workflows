import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<SearchController>(
        init: SearchController(),
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
                    child: ListView(
                      children: controller.lData.map(
                        (d) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: const Color(0xff86FFCA),
                                    iconSVG: R.ASSETS_ICONS_IC_RESPOND_LEFT_SVG,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: AppColors.colorFul2,
                                    iconSVG: R.ASSETS_ICONS_IC_BIN_SVG,
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: EdgeInsets.all(d['complete'] == false ? 20 : 19),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: d['complete'] == true ? Border.all(color: AppColors.background2) : null,
                                  color: d['complete'] == false ? AppColors.background2 : AppColors.background,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: d['complete'] == false ? AppColors.background : AppColors.background2,
                                      ),
                                      child: Stack(
                                        children: const [],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
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
