// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class AppBarDefault extends StatelessWidget {
  final bool? leading;
  final Function()? onTap;
  final String? title;
  final List<Widget>? actions;
  const AppBarDefault({super.key, this.leading = false, this.onTap, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 44),
      child: Row(
        children: [
          if (leading != false)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap ?? () => Get.back(),
              child: Container(
                height: 26.67,
                width: 26.67,
                padding: const EdgeInsets.symmetric(horizontal: 5.34, vertical: 4.88),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border, width: 2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: SvgPicture.asset(R.ASSETS_ICONS_IC_ARROW_LEFT_SVG, fit: BoxFit.scaleDown),
              ),
            ),
          if (leading == false && title != null && actions != null) const SizedBox(height: 26.67, width: 26.67),
          if (title != null)
            Expanded(
              child: Text(
                title ?? '',
                style: StyleText.poppins18w600,
                textAlign: TextAlign.center,
              ),
            ),
          if (actions != null)
            leading == true || (leading == false && title != null) ? Row(children: actions ?? []) : Expanded(child: Row(children: actions ?? [])),
        ],
      ),
    );
  }
}
