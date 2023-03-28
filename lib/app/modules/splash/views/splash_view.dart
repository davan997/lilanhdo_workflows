import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/splash/controllers/splash_controller.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xff181A20),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
                  child: Image.asset(R.ASSETS_IMAGES_LOGO_1_PNG),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LilDo ',
                      style: StyleText.poppins40w600.copyWith(color: Colors.white),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          stops: [0.1, 0.6, 0.8, 1],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFFB8E0),
                            Color(0xffBE9EFF),
                            Color(0xff88C0FC),
                            Color(0xff86FF99),
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Text('Hub', style: StyleText.poppins40Bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
