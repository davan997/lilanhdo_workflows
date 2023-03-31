import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

Widget defaultAppBar({bool leading = false, Function()? onTap, String? title, List<Widget>? actions}) {
  return Container(
    height: getHeight(48),
    padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
    margin: EdgeInsets.only(top: getHeight(44)),
    child: Row(
      children: [
        if (leading)
          GestureDetector(
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
        Expanded(
          child: Text(
            title ?? '',
            style: StyleText.poppins18w600,
            textAlign: TextAlign.center,
          ),
        ),
        Row(children: actions ?? []),
      ],
    ),
  );
}

InputDecoration inputDecoration({Widget? suffixIcon}) {
  return InputDecoration(
    isDense: true,
    focusColor: AppColors.colorFul5,
    suffixIconConstraints: BoxConstraints(
      minWidth: getWidth(16),
      minHeight: getHeight(16),
    ),
    suffixIcon: suffixIcon,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.background2),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.colorFul5),
    ),
  );
}
