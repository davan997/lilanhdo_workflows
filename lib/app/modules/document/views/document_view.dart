import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  const DocumentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocumentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
