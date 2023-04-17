import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/component/custom_switch.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/controllers/home_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';

class BSFilterHome extends StatelessWidget {
  final HomeController controller;
  const BSFilterHome({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List cloneOption = [];
    for (int i = 0; i < controller.lOption.length; i++) {
      cloneOption.add(true.obs);
      cloneOption[i].value = controller.lOption[i]['switch'].value;
    }
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.deActive,
            ),
          ),
          Column(
            children: controller.lOption.map(
              (d) {
                final index = controller.lOption.indexOf(d);
                return Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(d['icons']),
                      const SizedBox(width: 20),
                      Text(d['title'], style: StyleText.inter16Bold),
                      const Spacer(),
                      CustomSwitch(
                        valuer: cloneOption[index],
                        showBorder: true,
                        onChanged: (l) {
                          cloneOption[index].value = !cloneOption[index].value;
                        },
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.turnOfAllSwitch();
                    Get.back();
                  },
                  child: Text(
                    'Clear All',
                    style: StyleText.interBold.copyWith(color: AppColors.deActive),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    for (int i = 0; i < controller.lOption.length; i++) {
                      controller.lOption[i]['switch'].value = cloneOption[i].value;
                    }
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 139,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ],
                    ),
                    child: Text('Save Changes', style: StyleText.interBold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
