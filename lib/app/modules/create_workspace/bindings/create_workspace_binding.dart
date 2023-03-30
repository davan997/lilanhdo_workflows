import 'package:get/get.dart';

import '../controllers/create_workspace_controller.dart';

class CreateWorkspaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWorkspaceController>(
      () => CreateWorkspaceController(),
    );
  }
}
