import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';

class CustomSwitch extends StatefulWidget {
  final Rx<bool> valuer;
  final bool? showBorder;
  final Function(bool)? onChanged;
  const CustomSwitch({required this.valuer, this.showBorder = false, super.key, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 44,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: widget.valuer.value == false ? AppColors.background2 : AppColors.primary,
        borderRadius: BorderRadius.circular(200),
        border: widget.showBorder!
            ? Border.all(
                color: widget.valuer.value ? Colors.transparent : Colors.white.withOpacity(.1),
              )
            : null,
      ),
      child: Switch(
        value: widget.valuer.value,
        overlayColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) => Colors.transparent),
        trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) => Colors.transparent),
        thumbColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) => widget.valuer.value ? Colors.white : const Color(0xff4D5362)),
        onChanged: (l) => setState(() => widget.onChanged!(l)),
      ),
    );
  }
}
