import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/kelas_entity.dart';
import 'package:vigilanteyes/app/data/repositories/kelas_repository.dart';

// class SchoolCCTVController extends GetxController {
//   RxBool isLoading = false.obs;
//   List<KelasEntity>? resultKelasSchool;

//   final count = 0.obs;
//   @override
//   void onInit() {
//     print("Ini Isi LocalDB Id School ${LocalDb.idSchool}");
//     getListSchool();
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;

//   getListSchool({String? keyword}) async {
//     isLoading.value = true;
//     final kelasRepo = KelasRepository();
//     resultKelasSchool =
//         await kelasRepo.listAll(id: LocalDb.idSchool, keyword: keyword);
//     isLoading.value = false;
//   }

//   void searchClass(String keyword) {
//     getListSchool(keyword: keyword);
//   }
// }
class SchoolCCTVController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<KelasEntity> resultKelasSchool = <KelasEntity>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    if (kDebugMode) {
      print("Ini Isi LocalDB Id School ${LocalDb.idSchool}");
    }
    getListSchool();
    super.onInit();
  }

  void increment() => count.value++;

  getListSchool({String? keyword}) async {
    isLoading.value = true;
    final kelasRepo = KelasRepository();
    try {
      resultKelasSchool.value =
          await kelasRepo.listAll(id: LocalDb.idSchool, keyword: keyword);
    } catch (e) {
      // Handle exception
      resultKelasSchool.clear();
      Get.snackbar('Error', 'Failed to load data');
    }
    isLoading.value = false;
  }

  void searchClass(String keyword) {
    getListSchool(keyword: keyword);
  }
}
