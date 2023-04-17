import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';

class Productivity extends StatelessWidget {
  final HomeController controller;
  const Productivity({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(18, 20, 24, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.background2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Goal',
                      style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 40,
                          margin: const EdgeInsets.only(right: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: AppGradient.gradient_4,
                          ),
                          child: Text('3/5', style: StyleText.interBold),
                        ),
                        Text('tasks', style: StyleText.inter16w600),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'You marked 3/5 tasks\nare done 🎉',
                      style: StyleText.inter13.copyWith(color: AppColors.deActive),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.secondary,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 16,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ],
                      ),
                      child: Text('All Task', style: StyleText.interBold),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        color: AppColors.deActive,
                        value: 1,
                        strokeWidth: 10,
                      ),
                    ),
                    Transform.rotate(
                      angle: 1.57,
                      child: const SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          color: Color(0xff86FFCA),
                          value: 0.75,
                          strokeWidth: 10,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/ic_symbol.svg'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.background2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Completed in the last 7 Days',
                    style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: controller.lChart.map(
                        (d) {
                          return Column(
                            children: [
                              Container(
                                width: 6,
                                height: 57,
                                margin: const EdgeInsets.symmetric(horizontal: 14),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8),
                                    bottom: Radius.circular(2),
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, containers) {
                                        return Container(
                                          width: 6,
                                          height: containers.maxHeight * (d['project'] / 20),
                                          decoration: BoxDecoration(
                                            color: AppColors.colorFul1,
                                            borderRadius: const BorderRadius.vertical(
                                              top: Radius.circular(8),
                                              bottom: Radius.circular(2),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    LayoutBuilder(
                                      builder: (context, containers) {
                                        return Container(
                                          width: 6,
                                          height: containers.maxHeight * (d['task'] / 20),
                                          decoration: BoxDecoration(
                                            color: AppColors.colorFul2,
                                            borderRadius: const BorderRadius.vertical(
                                              top: Radius.circular(8),
                                              bottom: Radius.circular(2),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                d['title'],
                                style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: controller.lQuantity.map(
                        (d) {
                          final index = controller.lQuantity.indexOf(d);
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 0 : 6,
                              bottom: index == controller.lQuantity.length - 1 ? 0 : 6,
                            ),
                            child: Text(
                              d.toString(),
                              style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        '108 Tasks',
                        style: StyleText.interBold.copyWith(color: AppColors.colorFul2),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        '6 Projects',
                        style: StyleText.interBold.copyWith(color: AppColors.colorFul1),
                      ),
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
