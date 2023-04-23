import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lilanhdo_workflows/app/modules/search/controllers/search_controller.dart';
import 'package:lilanhdo_workflows/app/themes/color_app.dart';
import 'package:lilanhdo_workflows/app/themes/text_style.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class Task extends StatelessWidget {
  final SearchController controller;
  final Map item;
  const Task({
    super.key,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: const Color(0xff86FFCA),
              icon: Icons.delete_outlined,
            ),
            SlidableAction(
              onPressed: (context) {
                controller.deleteTask(item);
              },
              backgroundColor: AppColors.colorFul2,
              icon: Icons.delete_outlined,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(item['complete'] == false ? 20 : 19),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: item['complete'] == true ? Border.all(color: AppColors.background2) : null,
            color: item['complete'] == false ? AppColors.background2 : AppColors.background,
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(item['complete'] == false ? 4 : 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item['complete'] == false ? AppColors.background : AppColors.background2,
                ),
                child: item['complete'] == false
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (rect) {
                              return AppGradient.gradient_2.createShader(rect);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: CircularProgressIndicator(
                                strokeWidth: 6,
                                value: 1 / (item['total'] / item['work']),
                              ),
                            ),
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(gradient: AppGradient.gradient_4, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          R.ASSETS_ICONS_IC_CHECK_WHITE_SVG,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: StyleText.inter16w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['task'],
                      style: StyleText.inter13w500.copyWith(color: AppColors.deActive),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                '${DateFormat('E').format(item['date'])} ${DateFormat('d').format(item['date'])}',
                style: StyleText.inter13Bold.copyWith(color: item['color_date']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
