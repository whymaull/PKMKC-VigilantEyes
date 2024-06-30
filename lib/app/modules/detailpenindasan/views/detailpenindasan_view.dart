import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vigilanteyes/app/core/utils/colors.dart';
import 'package:vigilanteyes/app/core/utils/helpers.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';
import 'package:vigilanteyes/app/widget/recent_bullying_card.dart';

import '../controllers/detailpenindasan_controller.dart';

class DetailpenindasanView extends GetView<DetailpenindasanController> {
  const DetailpenindasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${catagoryBull(Get.arguments)}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: controller.isIncidentLoading.value
                                ? Colors.grey
                                : Colors.amber,
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(() => controller.isIncidentLoading.value
                            ? Text(
                                "Penidasan Fisik total",
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                "Penidasan Fisik total ${controller.resultListIncidentIdSchoolAndIdBull1?.length == 0 ? 0 : controller.resultListIncidentIdSchoolAndIdBull1?.length}"))),
                  ),
                  Text("Filter")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => controller.isIncidentLoading.value
                  ? CircularProgressIndicator()
                  : controller.resultListIncidentIdSchoolAndIdBull1!.length == 0
                      ? Text("Data Kosong")
                      : Expanded(
                          child: ListView.builder(
                          itemCount: controller
                              .resultListIncidentIdSchoolAndIdBull1!.length,
                          itemBuilder: (context, index) {
                            final result = controller
                                .resultListIncidentIdSchoolAndIdBull1![index];
                            return recentBullying(
                              imagePath: '${result.imageVideo}',
                              className: 'Kelas ${result.idSchool}',
                              type: "${catagoryBull(Get.arguments)}",
                              date:
                                  '${DateFormat('yyyy-MM-dd HH:mm:ss').format(result!.createdAt)}',
                            );
                          },
                        ))),
            ],
          ),
        ));
  }
}
