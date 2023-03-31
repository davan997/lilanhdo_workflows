import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/modules/document/views/document_view.dart';
import 'package:lilanhdo_workflows/app/modules/home_all/home/views/home_view.dart';
import 'package:lilanhdo_workflows/app/modules/notification/views/notification_view.dart';
import 'package:lilanhdo_workflows/app/modules/search/views/search_view.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class NavigatorBarController extends GetxController {
  final currentIndex = 0.obs;
  final menus = [
    {
      "icon_one": R.ASSETS_ICONS_IC_CATEGORY_SVG,
      "icon_two": R.ASSETS_ICONS_IC_CATEGORY_PICKED_SVG,
    },
    {
      "icon_one": R.ASSETS_ICONS_IC_DOCUMENT_SVG,
      "icon_two": R.ASSETS_ICONS_IC_DUCOMENT_PICKED_SVG,
    },
    {
      "icon": R.ASSETS_ICONS_IC_PLUS_SVG,
    },
    {
      "icon_one": R.ASSETS_ICONS_IC_NOTIFICATION_SVG,
      "icon_two": R.ASSETS_ICONS_IC_NOTIFICATION_PICKED_SVG,
    },
    {
      "icon_one": R.ASSETS_ICONS_IC_SEARCH_SVG,
      "icon_two": R.ASSETS_ICONS_IC_SEARCH_PICKED_SVG,
    },
  ];
  final pages = [
    const HomeView(),
    const DocumentView(),
    const SizedBox(),
    const NotificationView(),
    const SearchView(),
  ];

  @override
  void onClose() {
    super.onClose();
    currentIndex.close();
  }
}
