import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

Widget defaultAppBar({bool leading = false, Function()? onTap, String? title, List<Widget>? actions}) {
  return Container(
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    margin: const EdgeInsets.only(top: 44),
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
        if (title != null)
          Expanded(
            child: Text(
              title,
              style: StyleText.poppins18w600,
              textAlign: TextAlign.center,
            ),
          ),
        if (actions != null) leading == true ? Row(children: actions) : Expanded(child: Row(children: actions)),
      ],
    ),
  );
}

InputDecoration inputDecoration(
    {Widget? suffixIcon, Widget? prefixIcon, double? sizeIcon, bool isBorderBottom = false}) {
  return InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.only(top: 3),
    focusColor: AppColors.colorFul5,
    prefixIconConstraints: BoxConstraints(
      minWidth: sizeIcon ?? 16,
      minHeight: sizeIcon ?? 16,
    ),
    suffixIconConstraints: BoxConstraints(
      minWidth: sizeIcon ?? 16,
      minHeight: sizeIcon ?? 16,
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: isBorderBottom != false
          ? BorderSide(color: AppColors.colorFul5)
          : const BorderSide(color: Colors.transparent),
    ),
  );
}
