import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/splash/controllers/splash_controller.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
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
          backgroundColor: AppColors.background,
          body: Obx(
            () => controller.changeView.value == false
                ? Column(
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
                            style: StyleText.poppins40w600,
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
                  )
                : SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 3, left: 123),
                          child: SvgPicture.asset(R.ASSETS_ICONS_IC_FULL_POLYGON_SVG, height: 16, width: 16),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(R.ASSETS_ICONS_IC_HALF_POLYGON_RIGHT_SVG, fit: BoxFit.scaleDown),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 26),
                                      Container(
                                        height: 13,
                                        width: 13,
                                        margin: const EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.colorFul1,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: AppColors.background2,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 24,
                                              width: 24,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  transform: GradientRotation(-0.3),
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, .45, .67, 1],
                                                  colors: [
                                                    Color(0xffFFB37A),
                                                    Color(0xffFFECB7),
                                                    Color(0xffD6FFAA),
                                                    Color(0xff0091FF),
                                                  ],
                                                ),
                                              ),
                                              child:
                                                  SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                            ),
                                            const SizedBox(width: 16),
                                            SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                            const SizedBox(width: 52),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 53),
                                    ],
                                  ),
                                  const SizedBox(height: 36),
                                  SizedBox(
                                    height: 261,
                                    width: 350,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 91),
                                            Container(
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.colorFul2,
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 64,
                                              width: 64,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: AppGradient.gradient_1,
                                              ),
                                              child: Image.asset(R.ASSETS_IMAGES_HUMAN_1_PNG, fit: BoxFit.scaleDown),
                                            ),
                                            const SizedBox(width: 53),
                                          ],
                                        ),
                                        Positioned(
                                          top: 63.5,
                                          left: 0,
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: AppGradient.gradient_3,
                                            ),
                                            child: Image.asset(R.ASSETS_IMAGES_HUMAN_2_PNG, fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                        Positioned(
                                          top: 63.5,
                                          left: 52,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color: AppColors.background2,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: AppGradient.gradient_1,
                                                  ),
                                                  child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG,
                                                      fit: BoxFit.scaleDown),
                                                ),
                                                const SizedBox(width: 16),
                                                SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                                const SizedBox(width: 52),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 121,
                                          left: 112,
                                          child: Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorFul4,
                                            ),
                                            child: Image.asset(R.ASSETS_IMAGES_HUMAN_3_PNG, fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                        Positioned(
                                          top: 121,
                                          left: 210,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color: AppColors.background2,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: AppGradient.gradient_1,
                                                  ),
                                                  child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG,
                                                      fit: BoxFit.scaleDown),
                                                ),
                                                const SizedBox(width: 16),
                                                SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                                const SizedBox(width: 52),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 64),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 48),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Let\'s create\na space\nfor your\nworkflows.',
                                    style: StyleText.poppins40w600,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(R.ASSETS_ICONS_IC_ANGEL_LEFT_SVG, height: 197, width: 197),
                                Positioned(
                                  top: 90,
                                  right: 8,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Get.offAndToNamed(Routes.ONBOARDING);
                                    },
                                    child: SvgPicture.asset(R.ASSETS_ICONS_IC_ARROW_RIGHT_SVG, height: 20, width: 20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const SizedBox(width: 48),
                            Expanded(
                              child: ButtonDefault(
                                onPressed: () {
                                  Get.offAndToNamed(Routes.ONBOARDING);
                                },
                                title: 'Get Started',
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
