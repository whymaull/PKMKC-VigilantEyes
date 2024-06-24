import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onReady() {
    _onInit();

    super.onReady();
  }

  void increment() => count.value++;
}

void _onInit() {
  Future.delayed(const Duration(seconds: 3), () {
    if (LocalDb.repeat) {
      if (LocalDb.loggedAdmin) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  });
}
