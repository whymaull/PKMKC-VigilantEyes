import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/list_school.dart';
import 'package:vigilanteyes/app/widget/show_dialog_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Sekolah',
                    hintStyle: const TextStyle(fontSize: 16),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.only(left: 24),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 2),
                child: Text(
                  'Pilih Sekolah',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Expanded(
                      child: controller.resultListSchool!.length == 0
                          ? Center(
                              child: Text("Tidak Ada data"),
                            )
                          : ListView.builder(
                              itemCount: controller.resultListSchool!.length,
                              itemBuilder: (context, index) {
                                final resultSchool =
                                    controller.resultListSchool![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ListSchool(
                                    title: resultSchool.schoolname,
                                    imagePath: 'assets/logo.png',
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => ShowDialogCard(
                                          controller: controller.nameController,
                                          onTap: () async {
                                            controller.checkPasswordBtn(
                                                resultSchool.password,
                                                controller.nameController.text,
                                                resultSchool.schoolid);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ));
                }
              })

              // Expanded(
              //   child: ListView(
              //     children: [

              //       ListSchool(
              //         title: 'Sekolah 2',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 3',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 4',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 5',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 6',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 7',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 8',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 9',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 10',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 11',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //       ListSchool(
              //         title: 'Sekolah 12',
              //         imagePath: 'assets/logo.png',
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (context) => ShowDialogCard(),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
