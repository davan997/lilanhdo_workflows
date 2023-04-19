import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lilanhdo_workflows/app/component/app_bar_default.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Column(
            children: [
              AppBarDefault(
                title: 'Notification',
                actions: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorFul4,
                    ),
                    child: Image.asset(R.ASSETS_IMAGES_HUMAN_3_PNG),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: controller.lNotification.map(
                    (d) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.deActive.withOpacity(0.1538),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${d['name']} ${d['work']}',
                              style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(d['image'], height: 48, width: 48),
                                      ),
                                      if (d['status'] == 1)
                                        Positioned(
                                          top: -2.5,
                                          left: -2.5,
                                          child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: AppColors.background,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              height: 11,
                                              width: 11,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: AppGradient.gradient_4,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(d['name'], style: StyleText.interBold),
                                            Text(
                                              '${DateFormat('E').format(d['date'])} ${DateFormat('d').format(d['date'])}',
                                              style: StyleText.inter13Bold.copyWith(
                                                color: d['read'] == 0 ? const Color(0xff86FFCA) : AppColors.deActive,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          d['content'],
                                          style: StyleText.inter13.copyWith(color: AppColors.deActive),
                                          maxLines: 3,
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
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
