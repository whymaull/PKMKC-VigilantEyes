import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';

class ClassDetailController extends GetxController {
  List<IncidentEntity>? resultIncident;
  RxBool isLoading = false.obs;

  getIncident(String idCCTV) async {
    isLoading.value = true;
    final incident = IncidentRepository();
    resultIncident = await incident.listAllIdSchoollIdCCTV(
        idSchool: LocalDb.idSchool, idCCTV: idCCTV);
    isLoading.value = false;
  }
}
