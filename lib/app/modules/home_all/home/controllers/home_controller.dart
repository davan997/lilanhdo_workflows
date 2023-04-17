import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';

class HomeController extends GetxController {
  final currentTab = 0.obs;
  final lTab = ['Overview', 'Productivity'];
  final lOption = <dynamic>[
    {
      'image': 'assets/images/img_total_task.png',
      'icons': 'assets/icons/ic_circle_check_outline.svg',
      'background': AppGradient.gradient_3,
      'title': 'Total Task',
      'total': '16',
      'color': AppColors.colorFul6,
      'switch': true.obs,
    },
    {
      'icons': 'assets/icons/ic_back_up.svg',
      'background': AppGradient.gradient_9,
      'title': 'Task Due Soon',
      'total': '8',
      'color': const Color(0xff353843),
      'switch': true.obs,
    },
    {
      'icons': 'assets/icons/ic_circle_check.svg',
      'background': AppGradient.gradient_4,
      'title': 'Completed',
      'total': '32',
      'color': AppColors.colorFul5,
      'switch': true.obs,
    },
    {
      'icons': 'assets/icons/ic_flag.svg',
      'background': AppGradient.gradient_7,
      'title': 'Working on',
      'total': '24',
      'color': const Color(0xff86FFCA),
      'switch': true.obs,
    },
  ];
  final lQuantity = [20, 10, 0];
  final lChart = <dynamic>[
    {
      'title': 'M',
      'project': 18,
      'task': 11,
    },
    {
      'title': 'T',
      'project': 8,
      'task': 6,
    },
    {
      'title': 'W',
      'project': 11,
      'task': 8,
    },
    {
      'title': 'T',
      'project': 20,
      'task': 15,
    },
    {
      'title': 'F',
      'project': 10,
      'task': 8,
    },
    {
      'title': 'S',
      'project': 4,
      'task': 2,
    },
    {
      'title': 'S',
      'project': 3,
      'task': 1,
    },
  ];

  void turnOfAllSwitch() {
    for (var item in lOption) {
      item['switch'].value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();
    currentTab.close();
  }
}
