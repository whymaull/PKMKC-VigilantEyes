import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
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
    _onInit();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

void _onInit() {
  print(LocalDb.loggedInClient);
  Future.delayed(const Duration(seconds: 3), () {
    if (LocalDb.repeat) {
      // if (LocalDb.loggedIn) {
      //   print("ini login ${LocalDb.loggedIn}");
      print("ini Store ${LocalDb.loggedInClient}");
      if (LocalDb.loggedInClient) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    // } else {
    //   LocalDb.repeat = true;
    // }
  });
}
