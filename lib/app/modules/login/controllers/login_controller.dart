import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>(); // Tambahkan GlobalKey di sini
  GlobalKey<FormState> get formKey => _formKey;
  Rx<TextEditingController>? emailController;
  Rx<TextEditingController>? passwordController;
  var isObscure = true.obs;

  void toggleObscure() {
    print(" ini ${isObscure.value}");
    isObscure.value = !isObscure.value;
    print(" itu ${isObscure.value}");
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email lengkap harus diisi';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    } else if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  @override
  void onInit() {
    emailController = TextEditingController().obs;
    passwordController = TextEditingController().obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController?.value.dispose();
    passwordController?.value.dispose();

    super.onClose();
  }
}
