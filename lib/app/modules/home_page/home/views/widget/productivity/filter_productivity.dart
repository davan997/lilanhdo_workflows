import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';

class FilterProductivity extends StatelessWidget {
  final HomeController controller;
  const FilterProductivity({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background2,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: controller.lCreate.map(
            (d) {
              final index = controller.lCreate.indexOf(d);
              return GestureDetector(
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    d['routes']!,
                    
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: index == controller.lCreate.length - 1
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: Colors.white.withOpacity(0.02),
                            ),
                          ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(d['icon']!),
                      const SizedBox(width: 20),
                      Text(d['title']!, style: StyleText.inter16Bold),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
