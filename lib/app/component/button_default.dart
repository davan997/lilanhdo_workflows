import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';

class ButtonDefault extends StatelessWidget {
  final Function()? onPressed;
  final bool isButtonBorder;
  final bool isTextButton;
  final String? title;
  final String? icon;
  const ButtonDefault({
    super.key,
    required this.onPressed,
    this.isButtonBorder = false,
    this.title,
    this.icon,
    this.isTextButton = false,
  }) : assert(
          (isButtonBorder == false && isTextButton == false) ||
              (isButtonBorder != false && isTextButton == false) ||
              (isButtonBorder == false && isTextButton != false),
          'Chỉ được 1 kiểu isButton là true hoặc tất cả isButton là false Button sẻ trở về Button mặc định',
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isTextButton == true || isButtonBorder == true ? Colors.transparent : AppColors.primary,
        minimumSize: Size(Get.width, getHeight(48)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getBorderRadius(24)),
          side: BorderSide(color: isButtonBorder == true ? AppColors.border : Colors.transparent),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) SvgPicture.asset(icon!),
          if (icon != null && title != null) SizedBox(width: getWidth(12)),
          if (title != null)
            Text(
              title!,
              style: StyleText.interBold.copyWith(color: isTextButton == true ? AppColors.deActive : Colors.white),
            ),
        ],
      ),
    );
  }
}
