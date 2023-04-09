import 'package:flutter/material.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/utils/format.dart';

class CustomSwitch extends StatefulWidget {
  bool value;
  CustomSwitch({
    required this.value,
    super.key,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(24),
      width: getWidth(48),
      padding: EdgeInsets.symmetric(horizontal: getWidth(2), vertical: getHeight(2)),
      decoration: BoxDecoration(
        color: widget.value == false ? AppColors.background2 : AppColors.primary,
        borderRadius: BorderRadius.circular(getBorderRadius(200)),
      ),
      child: Switch(
        value: widget.value,
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return Colors.transparent;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return Colors.transparent;
        }),
        thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return widget.value ? Colors.white : const Color(0xff4D5362);
        }),
        onChanged: (l) {
          setState(() {
            widget.value = !widget.value;
          });
        },
      ),
    );
  }
}
