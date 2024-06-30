import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/kelas_entity.dart';
import 'package:vigilanteyes/app/data/repositories/kelas_repository.dart';

class SchoolCCTVController extends GetxController {
  RxBool isLoading = false.obs;
  List<KelasEntity>? resultKelasSchool;

  final count = 0.obs;
  @override
  void onInit() {
    // _onInit();
    print("Ini Isi LocalDB Id School ${LocalDb.idSchool}");
    getListSchool();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getListSchool() async {
    isLoading.value = true;
    final kelasRepo = KelasRepository();
    resultKelasSchool = await kelasRepo.listAll(LocalDb.idSchool);
    isLoading.value = false;
  }
}
