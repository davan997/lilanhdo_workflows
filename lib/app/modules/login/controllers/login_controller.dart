import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilanhdo_workflows/app/routes/app_pages.dart';
import 'package:lilanhdo_workflows/app/services/key.dart';

class LoginController extends GetxController {
  final currentView = 0.obs;
  final isShowPassword = true.obs;
  final emailController = TextEditingController();
  final contentEmail = ''.obs;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final contentPassword = ''.obs;

  Future<void> changeRegisterOrLogin({required String email}) async {
    final res = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    if (res.isNotEmpty) {
      currentView.value = 1;
      passwordController.text = '';
    } else {
      currentView.value = 2;
      nameController.text = '';
      passwordController.text = '';
    }
  }

  Future<void> signOrRegisterInWithEmailAndPassword({String? fullName, required String password}) async {
    final res = fullName == null
        ? await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: contentEmail.value,
            password: password,
          )
        : await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: contentEmail.value,
            password: password,
          );
    if (res.user != null) {
      if (fullName != null) {
        final dataUser = {
          'uid': res.user!.uid,
          'fullName': nameController.text,
          'email': res.user!.email ?? '',
          'phoneNumber': res.user!.phoneNumber ?? '',
          'photoURL': res.user!.photoURL ?? '',
        };
        await FirebaseFirestore.instance.collection('users').doc(res.user!.uid).set(dataUser);
      }
      final box = GetStorage();
      await box.write(StorageKey.LOG_IN, true);
      await box.write(StorageKey.ID_USER, res.user!.uid);
      Get.offAllNamed(Routes.NAVIGATOR_BAR);
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng kiểm tra lại mật khẩu của bạn!'),
        ),
      );
    }
  }

  @override
  void onClose() {
    currentView.close();
    contentEmail.close();
    contentPassword.close();
    isShowPassword.close();
    super.onClose();
  }
}
