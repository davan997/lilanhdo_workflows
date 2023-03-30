import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/splash/controllers/splash_controller.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
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
                      SizedBox(height: getHeight(20)),
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
                          padding: EdgeInsets.only(
                            top: getHeight(4),
                            bottom: getHeight(3),
                            left: getWidth(123),
                          ),
                          child: SvgPicture.asset(R.ASSETS_ICONS_IC_FULL_POLYGON_SVG, height: getHeight(16), width: getWidth(16)),
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
                                      SizedBox(width: getWidth(26)),
                                      Container(
                                        height: getHeight(13),
                                        width: getWidth(13),
                                        margin: EdgeInsets.only(bottom: getHeight(8)),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.colorFul1,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: getWidth(8), vertical: getHeight(8)),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(getBorderRadius(24)),
                                          color: AppColors.background2,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: getHeight(24),
                                              width: getWidth(24),
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
                                              child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                            ),
                                            SizedBox(width: getWidth(16)),
                                            SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                            SizedBox(width: getWidth(52)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: getWidth(53)),
                                    ],
                                  ),
                                  SizedBox(height: getHeight(36)),
                                  SizedBox(
                                    height: getHeight(261),
                                    width: getWidth(350),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: getHeight(91)),
                                            Container(
                                              height: getHeight(8),
                                              width: getWidth(8),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.colorFul2,
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: getHeight(64),
                                              width: getWidth(64),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: AppGradient.gradient_1,
                                              ),
                                              child: Image.asset(R.ASSETS_IMAGES_HUMAN_1_PNG, fit: BoxFit.scaleDown),
                                            ),
                                            SizedBox(width: getWidth(53)),
                                          ],
                                        ),
                                        Positioned(
                                          top: getHeight(63.5),
                                          left: 0,
                                          child: Container(
                                            height: getHeight(80),
                                            width: getWidth(80),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: AppGradient.gradient_3,
                                            ),
                                            child: Image.asset(R.ASSETS_IMAGES_HUMAN_2_PNG, fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                        Positioned(
                                          top: getHeight(63.5),
                                          left: getWidth(52),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: getHeight(8), horizontal: getWidth(8)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(getBorderRadius(24)),
                                              color: AppColors.background2,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: getHeight(24),
                                                  width: getWidth(24),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: AppGradient.gradient_1,
                                                  ),
                                                  child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                                ),
                                                SizedBox(width: getWidth(16)),
                                                SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                                SizedBox(width: getWidth(52)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: getHeight(121),
                                          left: getWidth(112),
                                          child: Container(
                                            height: getHeight(140),
                                            width: getWidth(140),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorFul4,
                                            ),
                                            child: Image.asset(R.ASSETS_IMAGES_HUMAN_3_PNG, fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                        Positioned(
                                          top: getHeight(121),
                                          left: getWidth(210),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: getWidth(8), vertical: getHeight(8)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(getBorderRadius(24)),
                                              color: AppColors.background2,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: getHeight(24),
                                                  width: getWidth(24),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: AppGradient.gradient_1,
                                                  ),
                                                  child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                                ),
                                                SizedBox(width: getWidth(16)),
                                                SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                                SizedBox(width: getWidth(52)),
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
                        SizedBox(height: getHeight(64)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: getWidth(48)),
                            Text(
                              'Let\'s create\na space\nfor your\nworkflows.',
                              style: StyleText.poppins40w600,
                            ),
                            const Spacer(),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_ICONS_IC_ANGEL_LEFT_SVG,
                                  height: getHeight(197),
                                  width: getWidth(197),
                                ),
                                Positioned(
                                  top: getHeight(90),
                                  right: getWidth(8),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Get.offAndToNamed(Routes.ONBOARDING);
                                    },
                                    child: SvgPicture.asset(
                                      R.ASSETS_ICONS_IC_ARROW_RIGHT_SVG,
                                      height: getHeight(20),
                                      width: getWidth(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getHeight(24)),
                        Padding(
                          padding: EdgeInsets.only(left: getWidth(48), right: getWidth(183)),
                          child: ButtonDefault(
                            onPressed: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            title: 'Get Started',
                          ),
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
