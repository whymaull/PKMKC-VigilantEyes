import 'package:get/get.dart';

import '../controllers/detailpenindasan_controller.dart';

class DetailpenindasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailpenindasanController>(
      () => DetailpenindasanController(),
    );
  }
}
