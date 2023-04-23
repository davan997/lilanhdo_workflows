import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_project_controller.dart';

class CreateProjectView extends GetView<CreateProjectController> {
  const CreateProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateProjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateProjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
