import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
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
      body: Column(
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
                        style: StyleText.poppins40w600,
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
                        color:
                            controller.currentIndex.value == index ? AppColors.primary : Colors.white.withOpacity(0.2),
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
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
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
      ),
    );
  }
}
