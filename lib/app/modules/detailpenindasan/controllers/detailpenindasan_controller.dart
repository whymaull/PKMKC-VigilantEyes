import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';
import 'package:vigilanteyes/app/modules/SchoolHome/controllers/school_home_controller.dart';

class DetailpenindasanController extends GetxController {
  SchoolHomeController controller = Get.put(SchoolHomeController());

  List<IncidentEntity>? resultListIncidentIdSchoolAndIdBull1;
  RxBool isIncidentLoading = false.obs;
  @override
  void onInit() {
    getIncedentByIdAll(
        LocalDb.idSchool, "${Get.arguments}", controller.selectedFilter.value);
    if (controller.selectedFilter.value == selectedFilter.value) {
      selectedFilter.value = selectedFilter.value;
    } else {
      selectedFilter.value = controller.selectedFilter.value;
    }
    super.onInit();
  }

  var selectedFilter = 'Hari ini'.obs;
  final List<String> filters = [
    'Hari ini',
    'Seminggu',
    'Sebulan',
    'Tahun',
  ];

  void applyFilter(String filter) {
    selectedFilter.value = filter;
    getIncedentByIdAll(LocalDb.idSchool, "${Get.arguments}", filter);
  }

  getIncedentByIdAll(String id, String idBull, String filter) async {
    isIncidentLoading.value = true;
    final incident = IncidentRepository();

    resultListIncidentIdSchoolAndIdBull1 = await incident.listAllTypeBullnById(
        idSchool: id, idBullying: idBull, filter: filter);

    isIncidentLoading.value = false;
  }
}
