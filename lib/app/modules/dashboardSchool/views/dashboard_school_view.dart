import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/modules/SchoolHome/views/school_home_view.dart';
import 'package:vigilanteyes/app/modules/profile/views/profile_view.dart';
import 'package:vigilanteyes/app/modules/recent/views/recent_view.dart';
import 'package:vigilanteyes/app/modules/schoolCCTV/views/school_cctv_view.dart';

import '../controllers/dashboard_school_controller.dart';

class DashboardSchoolView extends GetView<DashboardSchoolController> {
  const DashboardSchoolView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardSchoolController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                SchoolHomeView(),
                SchoolCCTVView(),
                RecentView(),
                // ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: buildBottomNavBar(controller),
        );
      },
    );
  }

  buildBottomNavBar(DashboardSchoolController controller) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: controller.changeTabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        itemNavBar(
          icon: Icons.home,
          label: '',
          isActive: controller.tabIndex == 0,
        ),
        itemNavBar(
          icon: Icons.search,
          label: '',
          isActive: controller.tabIndex == 1,
        ),
        itemNavBar(
          icon: Icons.list,
          label: '',
          isActive: controller.tabIndex == 2,
        ),
        itemNavBar(
          icon: Icons.person,
          label: '',
          isActive: controller.tabIndex == 3,
        ),
      ],
    );
  }

  itemNavBar(
      {required IconData icon, required String label, bool isActive = false}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: !isActive ? Colors.blue : Colors.black,
      ),
      label: label,
    );
  }
}
