import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/services/key.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                bottom: -16,
                left: 25,
                right: 25,
                child: Container(
                  height: 28,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.colorFul1.withOpacity(0.8),
                  ),
                ),
              ),
              Positioned(
                bottom: -8,
                left: 8,
                right: 8,
                child: Container(
                  height: 28,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.colorFul1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 8,
                  right: 8,
                ),
                height: 128,
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
                      child: GestureDetector(
                        onTap: () {
                          print(GetStorage().read(StorageKey.LOG_IN).toString());
                        },
                        child: Transform.rotate(
                          angle: 18,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: SvgPicture.asset(R.ASSETS_ICONS_IC_PLUS_SVG),
                          ),
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
                        const SizedBox(height: 4),
                        Text(
                          '3/5 is completed',
                          style: StyleText.interW500.copyWith(color: AppColors.lightModeActive),
                        ),
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, containers) {
                                        return Container(
                                          width: containers.maxWidth * 0.6899,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            gradient: AppGradient.gradient_9,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              '68.99%',
                              style: StyleText.interBold.copyWith(color: AppColors.lightModeActive),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Obx(
                  () => Column(
                    children: controller.lOption.map(
                      (d) {
                        if (d['switch'].value == false) {
                          return const SizedBox();
                        }
                        return Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.background2,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: d['background'],
                                ),
                                child: Image.asset('assets/images/image_total_task.png'),
                              ),
                              const SizedBox(width: 16),
                              Text(d['title'], style: StyleText.inter16Bold),
                              const Spacer(),
                              Text(
                                d['total'],
                                style: StyleText.inter16Bold.copyWith(color: d['color']),
                              ),
                              const SizedBox(width: 21),
                              SvgPicture.asset('assets/icons/ic_right_arrow.svg'),
                              const SizedBox(width: 16),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.background2,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.colorFul2,
                        ),
                        child: Image.asset('assets/images/img_total_project.png'),
                      ),
                      const SizedBox(width: 16),
                      Text('Total Projects', style: StyleText.inter16Bold),
                      const Spacer(),
                      Text(
                        8.toString(),
                        style: StyleText.inter16Bold.copyWith(color: AppColors.colorFul2),
                      ),
                      const SizedBox(width: 21),
                      SvgPicture.asset('assets/icons/ic_right_arrow.svg'),
                      const SizedBox(width: 16),
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
