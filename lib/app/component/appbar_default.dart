import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class AppBarDefault extends StatelessWidget {
  final Function()? onTap;
  // bool leading
  const AppBarDefault({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Container(
          height: getHeight(26.67),
          width: getWidth(26.67),
          padding: EdgeInsets.symmetric(horizontal: getWidth(5.34), vertical: getHeight(4.88)),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: getWidth(2)),
            borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(7)),
            ),
          ),
          child: SvgPicture.asset(R.ASSETS_ICONS_IC_ARROW_LEFT_SVG, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
