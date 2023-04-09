import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/navigator_bar/controllers/navigator_bar_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class NavigatorBarView extends GetView<NavigatorBarController> {
  const NavigatorBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => controller.pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(24, 26, 32, 0.85),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Obx(
          () => Row(
            children: controller.menus.map(
              (d) {
                final index = controller.menus.indexOf(d);
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.currentIndex.value = index;
                    },
                    child: Column(
                      children: [
                        index != 2
                            ? SvgPicture.asset(controller.currentIndex.value == index ? d["icon_two"]! : d["icon_one"]!)
                            : Container(
                                padding: const EdgeInsets.all(15.89),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child: SvgPicture.asset(d['icon']!),
                              ),
                        const Spacer(),
                        if (controller.currentIndex.value == index && controller.currentIndex.value != 2)
                          SvgPicture.asset(R.ASSETS_ICONS_IC_BOTTOM_NAVIGATOR_BAR_SVG),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
