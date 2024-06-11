import 'package:get/get.dart';

import '../controllers/dashboard_school_controller.dart';

class DashboardSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardSchoolController>(
      () => DashboardSchoolController(),
    );
  }
}
