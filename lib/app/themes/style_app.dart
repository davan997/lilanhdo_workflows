import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

Widget defaultAppBar({required String title, List<Widget>? actions}) {
  return Container(
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.34, vertical: 4.88),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: SvgPicture.asset(R.ASSETS_ICONS_IC_ARROW_LEFT_SVG),
          ),
        ),
        Expanded(
          child: Text(title, style: StyleText.poppins18w600, textAlign: TextAlign.center),
        ),
        Row(children: actions ?? []),
      ],
    ),
  );
}
