import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _onInit();
    super.onReady();
  }
}

void _onInit() {
  Future.delayed(const Duration(seconds: 3), () {
    if (LocalDb.repeat) {
      if (LocalDb.idSchool == '') {
        if (LocalDb.loggedAdmin) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
        }
      } else {
        Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  });
}
