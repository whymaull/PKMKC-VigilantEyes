import 'package:get/get.dart';

import '../controllers/school_cctv_controller.dart';

class SchoolCCTVBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolCCTVController>(
      () => SchoolCCTVController(),
    );
  }
}
