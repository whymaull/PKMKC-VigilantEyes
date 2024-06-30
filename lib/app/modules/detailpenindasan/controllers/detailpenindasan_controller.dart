import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';

class DetailpenindasanController extends GetxController {
  //TODO: Implement DetailpenindasanController
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull1;
  RxBool isIncidentLoading = false.obs;
  @override
  void onInit() {
    getIncedentByIdAll(LocalDb.idSchool, "${Get.arguments}");
    super.onInit();
  }

  getIncedentByIdAll(String id, String idBull) async {
    isIncidentLoading.value = true;
    final incident = IncidentRepository();

    resultListIncidentIdSchoolAndIdBull1 =
        await incident.listAllTypeBullnById(idSchool: id, idBullying: idBull);

    isIncidentLoading.value = false;
  }
}
