import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/views/widget/overview.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/views/widget/productivity.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              defaultAppBar(
                actions: [
                  Text('Dashboard', style: StyleText.poppins18w600),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset('assets/icons/ic_chat.svg'),
                      Positioned(
                        top: -getHeight(5.5),
                        right: -getWidth(5.5),
                        child: Container(
                          alignment: Alignment.center,
                          height: getHeight(16),
                          width: getWidth(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppGradient.gradient_8,
                          ),
                          child: Text('2', style: StyleText.inter10Bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: getWidth(40)),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorFul4,
                    ),
                    child: Image.asset(R.ASSETS_IMAGES_HUMAN_3_PNG),
                  ),
                ],
              ),
              SizedBox(height: getHeight(22)),
              Padding(
                padding: EdgeInsets.only(left: getWidth(24)),
                child: Text.rich(
                  style: StyleText.poppins36w600,
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Hello,\n'),
                      const TextSpan(text: 'Lil Anh Do'),
                      TextSpan(text: ' 👋', style: StyleText.poppins36),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(32)),
                child: Row(
                  children: [
                    Row(
                      children: controller.lTab.map(
                        (d) {
                          final index = controller.lTab.indexOf(d);
                          return GestureDetector(
                            onTap: () {
                              controller.currentTab.value = index;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(horizontal: getWidth(16), vertical: getHeight(4)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    getBorderRadius(16),
                                  ),
                                  color: controller.currentTab.value == index ? AppColors.primary : Colors.transparent,
                                ),
                                child: Text(
                                  d,
                                  style: StyleText.interBold.copyWith(
                                      color: controller.currentTab.value == index ? Colors.white : AppColors.deActive),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/ic_filter.svg'),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => controller.currentTab.value == 0
                      ? Overview(controller: controller)
                      : Productivity(controller: controller),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
