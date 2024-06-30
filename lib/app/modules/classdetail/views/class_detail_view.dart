import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/class_detail_controller.dart';

class ClassDetailView extends GetView<ClassDetailController> {
  const ClassDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getIncident("${Get.arguments}");
    return Scaffold(
        appBar: AppBar(
          title: Text("Kelas ${Get.arguments}"),
          // title: controller.isLoading.value
          //     ? CircularProgressIndicator()
          //     : Text(controller.resultIncident?.first.kelas ?? "Kelas"),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.resultIncident?.length,
                itemBuilder: (context, index) {
                  final result = controller.resultIncident?[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(result!.imageVideo),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Penindasan Verbal"),
                            Text("20 Juli 2024"),
                            Text("10:00 WIB"),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                })));
  }
}
