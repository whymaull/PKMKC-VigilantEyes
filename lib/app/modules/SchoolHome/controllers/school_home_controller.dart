import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';
import 'package:vigilanteyes/app/data/repositories/school_repository.dart';

class SchoolHomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isIncidentLoading = true.obs;
  SchoolEntity? resultListSchool;
  List<IncidentEntity>? resultListIncident;
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull1;
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull2;
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull3;
  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull4;

  @override
  void onInit() {
    getListSchool(int.parse(LocalDb.idSchool));
    getIncedentByIdAll(LocalDb.idSchool);

    super.onInit();
  }

  getListSchool(int id) async {
    isLoading.value = true;
    final schoolRepo = SchoolRepository();
    resultListSchool = await schoolRepo.findById(id);
    isLoading.value = false;
  }

  getIncedentByIdAll(String id) async {
    isIncidentLoading.value = true;
    final incident = IncidentRepository();
    resultListIncident = await incident.listAll(id);
    resultListIncidentIdSchoolAndIdBull1 =
        await incident.listAllTypeBullnById(idSchool: id, idBullying: "1");
    resultListIncidentIdSchoolAndIdBull2 =
        await incident.listAllTypeBullnById(idSchool: id, idBullying: "2");
    resultListIncidentIdSchoolAndIdBull3 =
        await incident.listAllTypeBullnById(idSchool: id, idBullying: "3");
    resultListIncidentIdSchoolAndIdBull4 =
        await incident.listAllTypeBullnById(idSchool: id, idBullying: "4");
    isIncidentLoading.value = false;
  }

  double getPersen1() {
    int bull1Length = resultListIncidentIdSchoolAndIdBull1!.length;
    int bull2Length = resultListIncidentIdSchoolAndIdBull2!.length;
    int bull3Length = resultListIncidentIdSchoolAndIdBull3!.length;
    int bull4Length = resultListIncidentIdSchoolAndIdBull4!.length;

    int total = bull1Length + bull2Length + bull3Length + bull4Length;

    if (total == 0) {
      return 0.0; // Menghindari pembagian dengan nol
    }

    double persen1 = (bull1Length / total) * 100;
    return persen1;
  }

  double getPersen2() {
    int bull1Length = resultListIncidentIdSchoolAndIdBull1!.length;
    int bull2Length = resultListIncidentIdSchoolAndIdBull2!.length;
    int bull3Length = resultListIncidentIdSchoolAndIdBull3!.length;
    int bull4Length = resultListIncidentIdSchoolAndIdBull4!.length;

    int total = bull1Length + bull2Length + bull3Length + bull4Length;

    if (total == 0) {
      return 0.0; // Menghindari pembagian dengan nol
    }

    double persen1 = (bull2Length / total) * 100;
    return persen1;
  }

  double getPersen3() {
    int bull1Length = resultListIncidentIdSchoolAndIdBull1!.length;
    int bull2Length = resultListIncidentIdSchoolAndIdBull2!.length;
    int bull3Length = resultListIncidentIdSchoolAndIdBull3!.length;
    int bull4Length = resultListIncidentIdSchoolAndIdBull4!.length;

    int total = bull1Length + bull2Length + bull3Length + bull4Length;

    if (total == 0) {
      return 0.0; // Menghindari pembagian dengan nol
    }

    double persen1 = (bull3Length / total) * 100;
    return persen1;
  }

  double getPersen4() {
    int bull1Length = resultListIncidentIdSchoolAndIdBull1!.length;
    int bull2Length = resultListIncidentIdSchoolAndIdBull2!.length;
    int bull3Length = resultListIncidentIdSchoolAndIdBull3!.length;
    int bull4Length = resultListIncidentIdSchoolAndIdBull4!.length;

    int total = bull1Length + bull2Length + bull3Length + bull4Length;

    if (total == 0) {
      return 0.0; // Menghindari pembagian dengan nol
    }

    double persen1 = (bull4Length / total) * 100;
    return persen1;
  }
}
