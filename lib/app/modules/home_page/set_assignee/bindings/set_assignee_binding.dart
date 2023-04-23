import 'package:get/get.dart';

import '../controllers/set_assignee_controller.dart';

class SetAssigneeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetAssigneeController>(
      () => SetAssigneeController(),
    );
  }
}
