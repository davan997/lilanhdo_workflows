import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/login/controllers/login_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class EnterEmail extends StatelessWidget {
  const EnterEmail({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Text(
                'What’s your\nemail\naddress?',
                style: StyleText.poppins32w600,
              ),
              const Spacer(),
              SvgPicture.asset(
                R.ASSETS_ICONS_IC_HAFT_POLYGON_LEFT_SVG,
                height: 93,
                width: 93,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'your email'.toUpperCase(),
                style: StyleText.inter10Bold.copyWith(color: AppColors.deActiveDark),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.emailController,
                autovalidateMode: AutovalidateMode.always,
                style: StyleText.inter16w600,
                onChanged: (d) {
                  controller.contentEmail.value = d;
                },
                decoration: inputDecoration(
                  isBorderBottom: true,
                  suffixIcon: Obx(
                    () => controller.contentEmail.value != ''
                        ? InkWell(
                            onTap: () {
                              controller.emailController.text = '';
                              controller.contentEmail.value = '';
                            },
                            child: SvgPicture.asset(R.ASSETS_ICONS_IC_CLOSE_CIRCLE_SVG),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ButtonDefault(
                onPressed: () {
                  controller.changeRegisterOrLogin(email: controller.contentEmail.value);
                },
                icon: R.ASSETS_ICONS_IC_MAIL_SVG,
                title: 'Continue with Email',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
