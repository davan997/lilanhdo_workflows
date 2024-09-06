import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final currentView = 0.obs;
  final isShowPassword = true.obs;
  final emailController = TextEditingController();
  final contentEmail = ''.obs;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final contentPassword = ''.obs;

  @override
  void onClose() {
    currentView.close();
    contentEmail.close();
    contentPassword.close();
    isShowPassword.close();
    super.onClose();
  }
}
