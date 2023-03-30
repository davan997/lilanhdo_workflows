import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/login/controllers/login_controller.dart';
import 'package:lilanhdo_workflows/app/modules/login/views/widget/enter_email.dart';
import 'package:lilanhdo_workflows/app/modules/login/views/widget/log_in.dart';
import 'package:lilanhdo_workflows/app/modules/login/views/widget/sign_up.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            defaultAppBar(
              onTap: () {
                if (controller.currentView.value != 0) {
                  controller.currentView.value = 0;
                } else {
                  Get.back();
                }
              },
            ),
            SizedBox(height: getHeight(32)),
            Obx(
              () => controller.currentView.value == 0
                  ? EnterEmail(controller: controller)
                  : controller.currentView.value == 1
                      ? LogIn(controller: controller)
                      : SignUp(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
