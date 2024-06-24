import 'package:get/get.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';

class DashboardSchoolController extends GetxController {
  //TODO: Implement DashboardSchoolController
  // RxBool isLoading = false.obs;
  // SchoolEntity? resultListSchool;
  final count = 0.obs;

  @override
  void onInit() {
    // getListSchool(1);

    super.onInit();
  }

  void increment() => count.value++;

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;

    update();
  }

  // getListSchool(int id) async {
  //   isLoading.value = true;
  //   final schoolRepo = SchoolRepository();
  //   resultListSchool = await schoolRepo.findById(id);
  //   print("Hasil $resultListSchool");
  //   isLoading.value = false;
  // }
}
