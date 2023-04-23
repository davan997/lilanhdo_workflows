import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/set_assignee_controller.dart';

class SetAssigneeView extends GetView<SetAssigneeController> {
  const SetAssigneeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetAssigneeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SetAssigneeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
