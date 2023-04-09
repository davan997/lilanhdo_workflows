import 'package:flutter/material.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';

class Productivity extends StatelessWidget {
  final HomeController controller;
  const Productivity({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(getWidth(18), getHeight(20), getWidth(24), getHeight(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.background2,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Goal',
                      style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                    ),
                    SizedBox(height: getHeight(16)),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: getWidth(8)),
                          padding: EdgeInsets.symmetric(
                            horizontal: getWidth(8),
                            vertical: getWidth(4),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getBorderRadius(100),
                            ),
                            gradient: AppGradient.gradient_4,
                          ),
                          child: Text('3/5', style: StyleText.interBold),
                        ),
                        Text('tasks', style: StyleText.inter16w600),
                      ],
                    ),
                    SizedBox(height: getHeight(16)),
                    Text(
                      'You marked 3/5 tasks\nare done 🎉',
                      style: StyleText.inter13.copyWith(color: AppColors.deActive),
                    ),
                    SizedBox(height: getHeight(16)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getWidth(20.5),
                        vertical: getHeight(10),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getBorderRadius(24),
                        ),
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
              ],
            ),
          ),
          SizedBox(height: getHeight(16)),
          Container(
            padding: EdgeInsets.only(top: getHeight(20), bottom: getHeight(20), right: getWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.background2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getWidth(20)),
                  child: Text(
                    'Completed in the last 7 Days',
                    style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                  ),
                ),
                SizedBox(height: getHeight(20)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: controller.lChart.map(
                        (d) {
                          return Column(
                            children: [
                              Container(
                                width: getWidth(6),
                                height: getHeight(57),
                                margin: EdgeInsets.symmetric(horizontal: getWidth(16)),
                                decoration: BoxDecoration(
                                  color: AppColors.colorFul1,
                                  borderRadius: const BorderRadius.vertical(
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
                                          width: getWidth(6),
                                          height: containers.maxHeight * (d['quantity'] / 20),
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
                              SizedBox(height: getHeight(6)),
                              Text(
                                d['title'],
                                style: StyleText.inter10Bold.copyWith(color: AppColors.deActive),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(width: getWidth(16)),
                    Column(
                      children: controller.lQuantity.map(
                        (d) {
                          final index = controller.lQuantity.indexOf(d);
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 0 : getHeight(6),
                              bottom: index == controller.lQuantity.length - 1 ? 0 : getHeight(6),
                            ),
                            child: Text(d.toString(), style: StyleText.inter10Bold.copyWith(color: AppColors.deActive)),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(20)),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(20)),
                  child: Row(
                    children: [
                      Text(
                        '108 Tasks',
                        style: StyleText.interBold.copyWith(color: AppColors.colorFul2),
                      ),
                      SizedBox(width: getWidth(24)),
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
