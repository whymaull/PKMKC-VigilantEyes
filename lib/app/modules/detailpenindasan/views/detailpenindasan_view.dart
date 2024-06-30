import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vigilanteyes/app/core/utils/helpers.dart';
import 'package:vigilanteyes/app/widget/recent_bullying_card.dart';

import '../controllers/detailpenindasan_controller.dart';

class DetailpenindasanView extends GetView<DetailpenindasanController> {
  const DetailpenindasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catagoryBull(Get.arguments)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: controller.isIncidentLoading.value
                                ? Colors.grey
                                : Colors.amber,
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(() => controller.isIncidentLoading.value
                            ? const Text(
                                "Penidasan Fisik total",
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                "Penidasan Fisik total ${controller.resultListIncidentIdSchoolAndIdBull1!.isEmpty ? 0 : controller.resultListIncidentIdSchoolAndIdBull1?.length}"))),
                    DropdownButton<String>(
                      value: controller.selectedFilter.value,
                      icon: const Icon(Icons.filter_list),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.applyFilter(newValue);
                        }
                      },
                      items: controller.filters
                          .map<DropdownMenuItem<String>>((String filter) {
                        return DropdownMenuItem<String>(
                          value: filter,
                          child: Text(filter),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => controller.isIncidentLoading.value
                  ? const CircularProgressIndicator()
                  : controller.resultListIncidentIdSchoolAndIdBull1!.isEmpty
                      ? const Text("Data Kosong")
                      : Expanded(
                          child: ListView.builder(
                          itemCount: controller
                              .resultListIncidentIdSchoolAndIdBull1!.length,
                          itemBuilder: (context, index) {
                            final result = controller
                                .resultListIncidentIdSchoolAndIdBull1![index];
                            return RecentBullying(
                              imagePath: result.imageVideo,
                              className: 'Kelas ${result.idSchool}',
                              type: catagoryBull(Get.arguments),
                              date: DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .format(result.createdAt),
                            );
                          },
                        ))),
            ],
          ),
        ));
  }
}
