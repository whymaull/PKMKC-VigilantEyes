import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool isLoading = false.obs;
  List<SchoolEntity>? resultListSchool;
  TextEditingController nameController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    // _onInit();
    getListSchool();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getListSchool() async {
    isLoading.value = true;
    final schoolRepo = SchoolRepository();
    resultListSchool = await schoolRepo.listAll();
    isLoading.value = false;
  }

  checkPasswordBtn(
      String passwordData, String passwordController, int arguments) async {
    if (passwordData == passwordController) {
      LocalDb.idSchool = arguments.toString();
      Get.back();
      Get.offAllNamed(Routes.DASHBOARD_SCHOOL);

      Get.snackbar('Berhasil', 'Login berhasil');
    } else {
      Get.snackbar('Password', 'Salah');
    }
  }

  _onInit() {
    print(LocalDb.idSchool);
    if (LocalDb.idSchool != '') {
      Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
    } else {}
  }
}
