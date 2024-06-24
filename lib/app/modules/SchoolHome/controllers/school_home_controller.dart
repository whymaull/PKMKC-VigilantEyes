import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';

class SchoolHomeController extends GetxController {
  //TODO: Implement SchoolHomeController
  RxBool isLoading = false.obs;
  RxBool isIncidentLoading = false.obs;
  SchoolEntity? resultListSchool;
  List<IncidentEntity>? resultListIncident;
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull;

  @override
  void onInit() {
    getListSchool(int.parse(LocalDb.idSchool));
    getIncedentById(LocalDb.idSchool);
    super.onInit();
  }

  // @override
  // void onReady() {

  //   getListSchool(1);
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  getListSchool(int id) async {
    isLoading.value = true;
    final schoolRepo = SchoolRepository();
    resultListSchool = await schoolRepo.findById(id);
    isLoading.value = false;
  }

  getIncedentById(String id) async {
    isIncidentLoading.value = true;
    final incident = IncidentRepository();
    resultListIncident = await incident.listAll(id);
    isIncidentLoading.value = false;
  }
  //   getIncedentById(String id) async {
  //   isIncidentLoading.value = true;
  //   final incident = IncidentRepository();
  //   resultListIncident = await incident.listAllByIdUser(id);
  //   isIncidentLoading.value = false;
  // }

  getIncedentByIdschoolNIdBulliying(
      {required String idSchool, required String idBull}) async {
    isIncidentLoading.value = true;
    final incident = IncidentRepository();
    resultListIncidentIdSchoolAndIdBull = await incident.listAllTypeBullnById(
        idSchool: idSchool, idBullying: idBull);
    isIncidentLoading.value = false;
  }
}
