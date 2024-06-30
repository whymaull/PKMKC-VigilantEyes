import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vigilanteyes/app/core/utils/helpers.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Expanded(
              child: InputTextField(
                title: 'Search for bullying by class',
                iconTextField: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : controller.resultListIncident?.length == 0
                    ? Text("Data Kosong")
                    : ListView.builder(
                        itemCount: controller.resultListIncident?.length,
                        itemBuilder: (context, index) {
                          final result = controller.resultListIncident?[index];
                          String incident = "Penidasan Fisik";

                          // switch (result?.idIncidents) {
                          //   case 1:
                          //     incident = "Penidasan Fisik";
                          //     break;
                          //   case 2:
                          //     incident = "Penidasan Verbal";

                          //     break;
                          //   case 3:
                          //     incident = "Penidasan Non-Verbal";
                          //     break;
                          //   case 4:
                          //     incident = "Penidasan Sexsual";

                          //     break;
                          //   default:
                          //     incident = "Penindasan Fisik";
                          // }
                          return recentBullying(
                              imagePath: '${result?.imageVideo}',
                              className: '${result?.kelas}',
                              type: "${catagoryBull(result!.idIncidents)}",
                              date:
                                  '${DateFormat('yyyy-MM-dd HH:mm:ss').format(result!.createdAt)}');
                        },
                      )),
          ),
        ],
      ),
    );
  }
}
