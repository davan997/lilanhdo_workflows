import 'package:get/get.dart';
import 'package:lilanhdo_workflows/generate/resource.dart';

class NotificationController extends GetxController {
  final lNotification = <dynamic>[
    {
      'name': 'Benjamin Poole',
      'work': 'mentioned you in Unity Gaming',
      'image': R.ASSETS_IMAGES_AVATAR_1_PNG,
      'date': DateTime.now(),
      'content': 'Hi @tranmautritam, when you have time please take a look at the new designs I just made in Figma. 👋',
      'status': 0,
      'read': 0,
    },
    {
      'name': 'Katharine Wells',
      'work': 'mentioned you in Unity Gaming',
      'image': R.ASSETS_IMAGES_AVATAR_2_PNG,
      'date': DateTime.now(),
      'content': 'Please make the presentation as soon as possible Tam. We’re still waiting for it. 🏀',
      'status': 1,
      'read': 1,
    },
    {
      'name': 'Bertha Ramos',
      'work': 'mentioned you in KJ Products',
      'image': R.ASSETS_IMAGES_AVATAR_3_PNG,
      'date': DateTime.now(),
      'content': 'Are you actually working? I don’t see any new stuffs from you. Be creative!!! 🤯',
      'status': 1,
      'read': 1,
    },
    {
      'name': 'Marie Bowen',
      'work': 'mentioned you in Productivity',
      'image': R.ASSETS_IMAGES_AVATAR_4_PNG,
      'date': DateTime.now(),
      'content': 'Are you actually working? I don’t see any new stuffs from you. Be creative!!! 🤯',
      'status': 0,
      'read': 1,
    },
  ];
}
