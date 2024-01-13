import 'package:get/get.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    _onInit();
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
}

void _onInit() {
  Future.delayed(const Duration(seconds: 4), () {
    Get.offAllNamed(Routes.START);
  });
}
