import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/login/controllers/login_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
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
          padding: EdgeInsets.only(left: getWidth(40)),
          child: Row(
            children: [
              Text(
                'What’s your\nemail\naddress?',
                style: StyleText.poppins32w600,
              ),
              const Spacer(),
              SvgPicture.asset(
                R.ASSETS_ICONS_IC_HAFT_POLYGON_LEFT_SVG,
                height: getHeight(93),
                width: getWidth(93),
              ),
            ],
          ),
        ),
        SizedBox(height: getHeight(24)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'your email'.toUpperCase(),
                style: StyleText.inter10Bold.copyWith(color: AppColors.deActiveDark),
              ),
              SizedBox(height: getHeight(8)),
              TextFormField(
                controller: controller.emailController,
                autovalidateMode: AutovalidateMode.always,
                style: StyleText.inter16w600,
                onChanged: (d) {
                  controller.contentEmail.value = d;
                },
                decoration: inputDecoration(
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
              SizedBox(height: getHeight(32)),
              ButtonDefault(
                onPressed: () {
                  controller.changeView();
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
