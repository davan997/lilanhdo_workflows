import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/button_default.dart';
import 'package:lilanhdo_workflows/app/modules/login/controllers/login_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/style_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
    required this.controller,
  });
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Text(
          'Sign Up',
          style: StyleText.poppins32w600,
        ),
        const SizedBox(height: 11),
        Text.rich(
          overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text: 'Using ',
                style: StyleText.inter13.copyWith(color: AppColors.deActive),
              ),
              TextSpan(
                text: controller.contentEmail.value,
                style: StyleText.inter13Bold.copyWith(decoration: TextDecoration.underline),
              ),
              TextSpan(
                text: ' to sign up',
                style: StyleText.inter13.copyWith(color: AppColors.deActive),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        Text(
          'your name'.toUpperCase(),
          style: StyleText.inter10Bold.copyWith(color: AppColors.deActiveDark),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.nameController,
          autovalidateMode: AutovalidateMode.always,
          style: StyleText.inter16w600,
          decoration: inputDecoration(isBorderBottom: true),
        ),
        const SizedBox(height: 24),
        Text(
          'your password'.toUpperCase(),
          style: StyleText.inter10Bold.copyWith(color: AppColors.deActiveDark),
        ),
        const SizedBox(height: 8),
        Obx(
          () => TextFormField(
            obscureText: controller.isShowPassword.value,
            controller: controller.passwordController,
            autovalidateMode: AutovalidateMode.always,
            style: StyleText.inter16w600,
            onChanged: (d) {
              controller.contentPassword.value = d;
            },
            decoration: inputDecoration(
              isBorderBottom: true,
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.isShowPassword.value = !controller.isShowPassword.value;
                },
                child: SvgPicture.asset(
                  controller.isShowPassword.value ? R.ASSETS_ICONS_IC_VISIBLE_SVG : R.ASSETS_ICONS_IC_UNVISIBLE_SVG,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 23),
        ButtonDefault(
          onPressed: () {},
          title: 'Sign Up',
        ),
      ],
    );
  }
}
