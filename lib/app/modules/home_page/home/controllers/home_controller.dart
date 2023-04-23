import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/create_event/views/create_event_view.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/create_project/views/create_project_view.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/create_task/views/create_task_view.dart';
import 'package:lilanhdo_workflows/app/modules/home_page/create_team/views/create_team_view.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class HomeController extends GetxController {
  final currentTab = 0.obs;
  final lTab = <String>['Overview', 'Productivity'];
  final lOption = <Map<String, dynamic>>[
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
  final lChart = <Map<String, dynamic>>[
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
  final lCreate = <Map<String, dynamic>>[
    {
      'icon': R.ASSETS_ICONS_IC_ADD_TASK_SVG,
      'title': 'Create Task',
      'routes': const CreateTaskView(),
    },
    {
      'icon': R.ASSETS_ICONS_IC_PROJECT_SVG,
      'title': 'Create Project',
      'routes': const CreateProjectView(),
    },
    {
      'icon': R.ASSETS_ICONS_IC_TEAM_SVG,
      'title': 'Create Team',
      'routes': const CreateTeamView(),
    },
    {
      'icon': R.ASSETS_ICONS_IC_CALENDAR_SVG,
      'title': 'Create Event',
      'routes': const CreateEventView(),
    },
  ];

  void turnOnAllSwitch() {
    for (var item in lOption) {
      item['switch'].value = true;
    }
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
    currentTab.close();
  }
}
