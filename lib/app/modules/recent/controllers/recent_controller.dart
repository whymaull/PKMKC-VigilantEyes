import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/repositories/incident_repository.dart';

class RecentController extends GetxController {
  final count = 0.obs;
  RxString valuee = "".obs;

  updateSearch(String va) {
    valuee.value = va;
  }

  RxBool isLoading = false.obs;
  List<IncidentEntity>? resultListIncident;
  @override
  void onInit() {
    getIncedentByIdAll(LocalDb.idSchool, "Hari ini");
    super.onInit();
  }

  var selectedFilter = 'Hari ini'.obs;
  final List<String> filters = [
    'Hari ini',
    'Seminggu',
    'Sebulan',
    'Tahun',
  ];

  void searchClass({required String keyword, required String filter}) {
    selectedFilter.value = filter;

    getIncedentByIdAll(LocalDb.idSchool, filter, keyword);

    if (kDebugMode) {
      print("Ini Filter: $filter, Ini Keyword : $keyword");
    }
  }

  getIncedentByIdAll(String id, [String? filter, String? keyword]) async {
    isLoading.value = true;
    final incident = IncidentRepository();
    resultListIncident =
        await incident.listAll(id, filter: filter, keyword: keyword);
    isLoading.value = false;
  }
}
