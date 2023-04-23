import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class CreateTaskController extends GetxController {
  final selectTask = 'Unity Dashboard'.obs;
  final lTask = ['Unity Dashboard', 'Collab Landing Page', 'Unity Gaming'];
  final editTaskName = TextEditingController();
  final contentTaskNam = 'Unity Dashboard'.obs;
  final lOption = <Map<String, dynamic>>[
    {
      'icon': R.ASSETS_ICONS_IC_TAG_SVG,
      'function': '',
    },
    {
      'icon': R.ASSETS_ICONS_IC_PIN_SVG,
      'function': '',
    },
    {
      'icon': R.ASSETS_ICONS_IC_FLAG_POINT_SVG,
      'function': '',
    },
    {
      'icon': R.ASSETS_ICONS_IC_IMAGE_STACK_SVG,
      'function': '',
    },
  ];

  @override
  void onClose() {
    super.onClose();
    selectTask.close();
    contentTaskNam.close();
  }
}
