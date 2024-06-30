import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';

class ClassDetailController extends GetxController {
  List<IncidentEntity>? resultIncident;
  RxBool isLoading = false.obs;
  var selectedFilter = 'Hari ini'.obs;
  final List<String> filters = [
    'Hari ini',
    'Seminggu',
    'Sebulan',
    'Tahun',
  ];
  getIncident(String idCCTV) async {
    isLoading.value = true;
    final incident = IncidentRepository();
    resultIncident = await incident.listAllIdSchoolIdCCTV(
        idSchool: LocalDb.idSchool, idCCTV: idCCTV);
    isLoading.value = false;
  }
}
