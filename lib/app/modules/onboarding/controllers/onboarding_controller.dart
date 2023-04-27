import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['openId'],
);

class OnboardingController extends GetxController {
  final currentIndex = 0.obs;
  final images = [
    {
      'image': R.ASSETS_IMAGES_ONBOADING_1_PNG,
      'content': 'Task,\nCalendar,\nChat',
    },
    {
      'image': R.ASSETS_IMAGES_ONBOADING_2_PNG,
      'content': 'Work\nAnywhere\nEasily',
    },
    {
      'image': R.ASSETS_IMAGES_ONBOARDING_3_PNG,
      'content': 'Manage\nEverything\non Phone',
    },
  ];

  Future<void> handleSignIn(bool isGoogle) async {
    try {
      final user = isGoogle ? await _googleSignIn.signIn() : await _googleSignIn.signIn();
      if (user != null) {}
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    currentIndex.close();
  }
}
