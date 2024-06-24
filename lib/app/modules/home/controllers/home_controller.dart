import 'package:get/get.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxBool isLoading = false.obs;
  List<SchoolEntity>? resultListSchool;
  final count = 0.obs;
  @override
  void onInit() {
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
}
