import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';

class ButtonDefault extends StatelessWidget {
  final Function()? onPressed;
  final bool isButtonBorder;
  final String? title;
  final String? icon;
  const ButtonDefault({
    super.key,
    required this.onPressed,
    this.isButtonBorder = false,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return isButtonBorder == false
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(Get.width, getHeight(48)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getBorderRadius(24)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) SvgPicture.asset(icon!),
                if (icon != null && title != null) SizedBox(width: getWidth(12)),
                if (title != null) Text(title!, style: StyleText.interBold),
              ],
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: Size(Get.width, getHeight(48)),
              side: BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getBorderRadius(24)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) SvgPicture.asset(icon!),
                if (icon != null && title != null) SizedBox(width: getWidth(12)),
                if (title != null) Text(title!, style: StyleText.interBold),
              ],
            ),
          );
  }
}
