import 'package:get/get.dart';

import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/dashboardSchool/bindings/dashboard_school_binding.dart';
import '../modules/dashboardSchool/views/dashboard_school_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/recent/bindings/recent_binding.dart';
import '../modules/recent/views/recent_view.dart';
import '../modules/schoolCCTV/bindings/school_cctv_binding.dart';
import '../modules/schoolCCTV/views/school_cctv_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.RECENT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => const DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_SCHOOL,
      page: () => const DashboardSchoolView(),
      binding: DashboardSchoolBinding(),
    ),
    GetPage(
      name: _Paths.SCHOOL_C_C_T_V,
      page: () => const SchoolCCTVView(),
      binding: SchoolCCTVBinding(),
    ),
    GetPage(
      name: _Paths.RECENT,
      page: () => const RecentView(),
      binding: RecentBinding(),
    ),
  ];
}
