import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final currentIndex = 0.obs;
  final lTab = ['Task', 'Mention', 'Files'];
  final controllerSearch = TextEditingController();
  final contentSearch = ''.obs;
  final isFocusSearch = false.obs;

  @override
  void onClose() {
    currentIndex.close();
    contentSearch.close();
    super.onClose();
  }
}
