import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/controllers/authcontroller_controller.dart';
import 'package:vigilanteyes/app/core/utils/colors.dart';
import 'package:vigilanteyes/app/modules/SchoolHome/controllers/school_home_controller.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());
  final ProfileController controller = Get.put(ProfileController());
  SchoolHomeController controllerSC = Get.put(SchoolHomeController());

  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.fetchUserClientByUuid();
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("${controller.resultUser!.username}"),
                    subtitle: Text(controller.resultUser!.schoolId == 0
                        ? "Admin"
                        : "${controller.resultUser!.schoolId}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text("50"),
                            Text("Kejadian"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Ubah Profile"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.dialog<bool>(
                                  AlertDialog(
                                    title: const Text('Keluar'),
                                    content: const Text(
                                      'Ingin keluar dari akun Anda?',
                                    ),
                                    actions: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff5CE1E6)),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: TextButton(
                                          onPressed: () =>
                                              Get.back(result: false),
                                          child: Text(
                                            'Batal',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: const Color(0xff5CE1E6)),
                                        child: TextButton(
                                          onPressed: () {
                                            _controller.signOut();
                                            // controller.logOut();
                                          },
                                          child: Text(
                                            'Ya, Keluar',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text("Keluar"),
                            ),
                          ],
                        ),
                        Text("Kejadian"),
                        controllerSC.isIncidentLoading.value
                            ? CircularProgressIndicator()
                            : GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  bullyingCard(
                                    persenIcident:
                                        "${controllerSC.getPersen1().toStringAsFixed(2)}",
                                    title: 'Penindasan FIsik',
                                    color: AppColors.contentColorBlue,
                                    sumIcident: controllerSC
                                            .resultListIncidentIdSchoolAndIdBull1
                                            ?.length
                                            .toStringAsFixed(0) ??
                                        "0",
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILPENINDASAN,
                                          arguments: 1);
                                    },
                                  ),
                                  bullyingCard(
                                    persenIcident:
                                        "${controllerSC.getPersen2().toStringAsFixed(2)}",
                                    title: 'Penindasan Verbal',
                                    color: AppColors.contentColorYellow,
                                    sumIcident: controllerSC
                                            .resultListIncidentIdSchoolAndIdBull2
                                            ?.length
                                            .toStringAsFixed(0) ??
                                        "0",
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILPENINDASAN,
                                          arguments: 2);
                                    },
                                  ),
                                  bullyingCard(
                                    persenIcident:
                                        "${controllerSC.getPersen3().toStringAsFixed(2)}",
                                    title: 'Penindasan Non Verbal',
                                    color: AppColors.contentColorPurple,
                                    sumIcident: controllerSC
                                            .resultListIncidentIdSchoolAndIdBull3
                                            ?.length
                                            .toStringAsFixed(0) ??
                                        "0",
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILPENINDASAN,
                                          arguments: 3);
                                    },
                                  ),
                                  bullyingCard(
                                    persenIcident:
                                        "${controllerSC.getPersen4().toStringAsFixed(2)}",
                                    title: 'Penindasan Sexsual',
                                    color: AppColors.contentColorGreen,
                                    sumIcident: controllerSC
                                            .resultListIncidentIdSchoolAndIdBull4
                                            ?.length
                                            .toStringAsFixed(0) ??
                                        "0",
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILPENINDASAN,
                                          arguments: 4);
                                    },
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              )));
  }
}
