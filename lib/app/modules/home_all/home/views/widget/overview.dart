import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class Overview extends StatelessWidget {
  final HomeController controller;
  const Overview({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                bottom: getHeight(-16),
                left: getWidth(25),
                right: getWidth(25),
                child: Container(
                  height: 28,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getBorderRadius(20),
                    ),
                    color: AppColors.colorFul1.withOpacity(0.8),
                  ),
                ),
              ),
              Positioned(
                bottom: getHeight(-8),
                left: getWidth(8),
                right: getWidth(8),
                child: Container(
                  height: 28,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getBorderRadius(20),
                    ),
                    color: AppColors.colorFul1,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: getWidth(24),
                  top: getHeight(8),
                  right: getWidth(8),
                ),
                height: getHeight(128),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const RadialGradient(
                    radius: 4,
                    center: Alignment(0.4, 2.8),
                    stops: [0, 0.166, 0.333, 0.499, 0.665, 1],
                    colors: [
                      Color(0xffFFB8E0),
                      Color(0xffFFB8E0),
                      Color(0xffBE9EFF),
                      Color(0xff88C0FC),
                      Color(0xff86FF99),
                      Color(0xff86FF99),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.rotate(
                        angle: 18,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: getWidth(6), vertical: getHeight(6)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: SvgPicture.asset(R.ASSETS_ICONS_IC_PLUS_SVG),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Priority Task Progress',
                          style: StyleText.poppins18w600.copyWith(color: AppColors.lightModeActive),
                        ),
                        SizedBox(height: getHeight(4)),
                        Text(
                          '3/5 is completed',
                          style: StyleText.interW500.copyWith(color: AppColors.lightModeActive),
                        ),
                        SizedBox(height: getHeight(17)),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                height: getHeight(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(getBorderRadius(5)),
                                ),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, containers) {
                                        return Container(
                                          width: containers.maxWidth * 0.6899,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getBorderRadius(5)),
                                            gradient: AppGradient.gradient_9,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: getWidth(25)),
                            Text(
                              '68.99%',
                              style: StyleText.interBold.copyWith(color: AppColors.lightModeActive),
                            ),
                            SizedBox(width: getWidth(16)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getHeight(32)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: controller.lOption.map(
                    (d) {
                      if (d['switch'] == false) {
                        return const SizedBox();
                      }
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(8), vertical: getHeight(8)),
                        margin: EdgeInsets.symmetric(vertical: getHeight(8)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getBorderRadius(16)),
                          color: AppColors.background2,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: getHeight(48),
                              width: getWidth(48),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: d['background'],
                              ),
                              child: Image.asset('assets/images/image_total_task.png'),
                            ),
                            SizedBox(width: getWidth(16)),
                            Text(d['title'], style: StyleText.inter16Bold),
                            const Spacer(),
                            Text(
                              d['total'],
                              style: StyleText.inter16Bold.copyWith(color: d['color']),
                            ),
                            SizedBox(width: getWidth(21)),
                            SvgPicture.asset('assets/icons/ic_right_arrow.svg'),
                            SizedBox(width: getWidth(16)),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(8), vertical: getHeight(8)),
                  margin: EdgeInsets.symmetric(vertical: getHeight(8)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getBorderRadius(16)),
                    color: AppColors.background2,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: getHeight(48),
                        width: getWidth(48),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.colorFul2,
                        ),
                        child: Image.asset('assets/images/img_total_project.png'),
                      ),
                      SizedBox(width: getWidth(16)),
                      Text('Total Projects', style: StyleText.inter16Bold),
                      const Spacer(),
                      Text(
                        8.toString(),
                        style: StyleText.inter16Bold.copyWith(color: AppColors.colorFul2),
                      ),
                      SizedBox(width: getWidth(21)),
                      SvgPicture.asset('assets/icons/ic_right_arrow.svg'),
                      SizedBox(width: getWidth(16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
