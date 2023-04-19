import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';

class SearchController extends GetxController {
  final currentIndex = 0.obs;
  final lTab = ['Task', 'Mention', 'Files'];
  final controllerSearch = TextEditingController();
  final contentSearch = ''.obs;
  final isFocusSearch = false.obs;
  final lData = <dynamic>[
    {
      'title': 'Unity Dashboard',
      'task': 'in UI Design Kit',
      'work': 3,
      'total': 4,
      'date': DateTime.now(),
      'complete': false,
      'color_date': AppColors.colorFul2,
    },
    {
      'title': 'Collab Landing Page',
      'task': 'in UI Design Kit',
      'work': 2,
      'total': 4,
      'date': DateTime.now(),
      'complete': false,
      'color_date': AppColors.colorFul5,
    },
    {
      'title': 'Unity Gaming',
      'task': 'Coded Template',
      'work': 4,
      'total': 4,
      'date': DateTime.now(),
      'complete': true,
      'color_date': AppColors.deActive,
    },
    {
      'title': 'Unity Dashboard',
      'task': 'in UI Design Kit',
      'work': 4,
      'total': 4,
      'date': DateTime.now(),
      'complete': false,
      'color_date': AppColors.colorFul2,
    },
  ].obs;

  void deleteTask(Map item) {
    lData.remove(item);
  }

  @override
  void onClose() {
    lData.close();
    currentIndex.close();
    contentSearch.close();
    super.onClose();
  }
}
