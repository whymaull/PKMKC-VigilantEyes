import 'package:get/get.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';

class DashboardSchoolController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;

    update();
  }
}
