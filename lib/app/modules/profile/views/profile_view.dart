// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/controllers/authcontroller_controller.dart';
import 'package:vigilanteyes/app/core/utils/colors.dart';
import 'package:vigilanteyes/app/modules/SchoolHome/controllers/school_home_controller.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';
import 'package:vigilanteyes/app/widget/CusButton.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());
  final ProfileController controller = Get.put(ProfileController());
  SchoolHomeController controllerSC = Get.put(SchoolHomeController());

  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Akun'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/logo.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.resultUser!.username),
                                Text(controller.resultUser!.schoolId == 0
                                    ? "Admin"
                                    : "${controller.resultUser!.schoolId}")
                              ],
                            ),
                          ],
                        ),
                        CusButton(
                          pad: 10,
                          title: "Keluar",
                          onTap: () {
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
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: TextButton(
                                      onPressed: () => Get.back(result: false),
                                      child: const Text(
                                        'Batal',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xff5CE1E6)),
                                    child: TextButton(
                                      onPressed: () {
                                        _controller.signOut();
                                      },
                                      child: const Text(
                                        'Ya, Keluar',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: controllerSC.isIncidentLoading.value
                        ? const CircularProgressIndicator()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Kejadian ${controllerSC.resultListIncidentIdSchoolAndIdBull1!.length + controllerSC.resultListIncidentIdSchoolAndIdBull2!.length + controllerSC.resultListIncidentIdSchoolAndIdBull3!.length + controllerSC.resultListIncidentIdSchoolAndIdBull4!.length}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  BullyingCard(
                                    ket: "${controllerSC.selectedFilter}",
                                    persenIcident: controllerSC
                                        .getPersen1()
                                        .toStringAsFixed(2),
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
                                  BullyingCard(
                                    ket: "${controllerSC.selectedFilter}",
                                    persenIcident: controllerSC
                                        .getPersen2()
                                        .toStringAsFixed(2),
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
                                  BullyingCard(
                                    ket: "${controllerSC.selectedFilter}",
                                    persenIcident: controllerSC
                                        .getPersen3()
                                        .toStringAsFixed(2),
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
                                  BullyingCard(
                                    ket: "${controllerSC.selectedFilter}",
                                    persenIcident: controllerSC
                                        .getPersen4()
                                        .toStringAsFixed(2),
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
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                  ),
                ],
              )));
  }
}
