// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/list_school.dart';

import '../controllers/school_cctv_controller.dart';

class SchoolCCTVView extends StatelessWidget {
  SchoolCCTVController controller = Get.put(SchoolCCTVController());

  SchoolCCTVView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextField(
                  onChanged: (value) {
                    controller.searchClass(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search CCTV by Class',
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
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 16),
              ),
              Obx(() => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.resultKelasSchool.isEmpty
                      ? const Center(child: Text("Data Kosong"))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: controller.resultKelasSchool.length,
                            itemBuilder: (context, index) {
                              final resultClass =
                                  controller.resultKelasSchool[index];
                              return ListSchool(
                                title: "${resultClass.lokasiCctv.capitalize}",
                                imagePath: 'assets/logo.png',
                                onTap: () {
                                  Get.toNamed(Routes.CLASS_DETAIL,
                                      arguments: resultClass.idCctv);
                                },
                              );
                            },
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }

  void showPasswordDialog(BuildContext context) {
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Password'),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
