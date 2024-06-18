import 'package:get/get.dart';

import '../controllers/school_home_controller.dart';

class SchoolHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolHomeController>(
      () => SchoolHomeController(),
    );
  }
}
