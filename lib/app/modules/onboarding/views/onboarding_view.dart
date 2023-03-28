import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => controller.changeView.value == true
            ? Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: Get.height / 1.5,
                      viewportFraction: 1,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      onPageChanged: (d, l) {
                        controller.currentIndex.value = d;
                      },
                    ),
                    items: controller.images.map(
                      (d) {
                        return Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset(d['image']!, fit: BoxFit.fill),
                            Positioned(
                              bottom: 0,
                              left: 40,
                              child: Text(
                                d['content']!,
                                style: StyleText.poppins40w600.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 32),
                    child: Obx(
                      () => Row(
                        children: controller.images.map(
                          (d) {
                            final index = controller.images.indexOf(d);
                            return Container(
                              height: 8,
                              width: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentIndex.value == index ? AppColors.primary : Colors.white.withOpacity(0.2),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        ButtonDefault(
                          onPressed: () {},
                          icon: R.ASSETS_ICONS_IC_MAIL_SVG,
                          title: 'Continue with Email',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ButtonDefault(
                                  onPressed: () {},
                                  isButtonBorder: true,
                                  icon: R.ASSETS_ICONS_IC_GG_SVG,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ButtonDefault(
                                  onPressed: () {},
                                  isButtonBorder: true,
                                  icon: R.ASSETS_ICONS_IC_FB_SVG,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'By continuing you agree LilDo Hub’s Terms of Services & Privacy Policy',
                          style: StyleText.inter12w500.copyWith(color: AppColors.deActive),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
                        SvgPicture.asset(R.ASSETS_ICONS_IC_HALF_POLYGON_RIGHT_SVG),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(width: Get.width / 14.42),
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
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: AppColors.background2,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Get.width / 15.62,
                                          width: Get.width / 15.62,
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
                                        SizedBox(width: Get.width / 23.37),
                                        SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                        SizedBox(width: Get.width / 7.21),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Get.width / 6.81),
                                ],
                              ),
                              SizedBox(height: Get.height / 22.55),
                              SizedBox(
                                height: 261,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: Get.width / 4.12),
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
                                            gradient: AppGradient.wip,
                                          ),
                                          child: Image.asset(R.ASSETS_IMAGES_HUMAN_1_PNG),
                                        ),
                                        SizedBox(width: Get.width / 6.81),
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
                                          gradient: AppGradient.inReview,
                                        ),
                                        child: Image.asset(R.ASSETS_IMAGES_HUMAN_2_PNG),
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
                                              height: Get.width / 15.62,
                                              width: Get.width / 15.62,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: AppGradient.wip,
                                              ),
                                              child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                            ),
                                            SizedBox(width: Get.width / 23.37),
                                            SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                            SizedBox(width: Get.width / 7.21),
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
                                        child: Image.asset(R.ASSETS_IMAGES_HUMAN_3_PNG),
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
                                              height: Get.width / 15.62,
                                              width: Get.width / 15.62,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: AppGradient.wip,
                                              ),
                                              child: SvgPicture.asset(R.ASSETS_ICONS_IC_CHECK_SVG, fit: BoxFit.scaleDown),
                                            ),
                                            SizedBox(width: Get.width / 23.37),
                                            SvgPicture.asset(R.ASSETS_ICONS_IC_NAME_TAG_SVG),
                                            SizedBox(width: Get.width / 7.21),
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
                  ],
                ),
              ),
      ),
    );
  }
}
