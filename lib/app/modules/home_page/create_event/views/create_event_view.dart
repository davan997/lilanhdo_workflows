import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_event_controller.dart';

class CreateEventView extends GetView<CreateEventController> {
  const CreateEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateEventView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateEventView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
