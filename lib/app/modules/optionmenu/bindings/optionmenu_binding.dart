import 'package:get/get.dart';

import '../controllers/optionmenu_controller.dart';

class OptionmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionmenuController>(
      () => OptionmenuController(),
    );
  }
}
