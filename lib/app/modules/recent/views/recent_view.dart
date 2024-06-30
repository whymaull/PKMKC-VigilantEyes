// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vigilanteyes/app/core/utils/helpers.dart';
import 'package:vigilanteyes/app/widget/recent_bullying_card.dart';

import '../controllers/recent_controller.dart';

class RecentView extends StatelessWidget {
  RecentController controller = Get.put(RecentController());

  RecentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              child: TextField(
                onChanged: (value) {
                  controller.updateSearch(value);
                  controller.searchClass(
                      keyword: value, filter: controller.selectedFilter.value);
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'Riwayat Kejadian',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Obx(() => DropdownButton<String>(
                      value: controller.selectedFilter.value,
                      icon: const Icon(Icons.filter_list),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.searchClass(
                            keyword: controller.valuee.value,
                            filter: newValue,
                          );
                        }
                      },
                      items: controller.filters
                          .map<DropdownMenuItem<String>>((String filter) {
                        return DropdownMenuItem<String>(
                          value: filter,
                          child: Text(filter),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
          Obx(() => controller.isLoading.value
              ? const SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator())
              : controller.resultListIncident!.isEmpty
                  ? const Text("Data Kosong")
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controller.resultListIncident?.length,
                        itemBuilder: (context, index) {
                          final result = controller.resultListIncident?[index];
                          return RecentBullying(
                              imagePath: '${result?.imageVideo}',
                              className: '${result?.kelas}',
                              type: catagoryBull(result!.idIncidents),
                              date: DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .format(result.createdAt));
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
