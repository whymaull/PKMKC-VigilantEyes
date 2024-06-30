import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/core/utils/colors.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';

import '../controllers/school_home_controller.dart';

class SchoolHomeView extends StatelessWidget {
  SchoolHomeController controller = Get.put(SchoolHomeController());
  SchoolHomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Obx(() => controller.isLoading.value
            ? CircularProgressIndicator()
            : Text("${controller.resultListSchool!.schoolname}")),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              LocalDb.idSchool == '';
              Get.offAllNamed(Routes.HOME);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => DropdownButton<String>(
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
                    )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => controller.isIncidentLoading.value
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              controller.getPersen1() == 0 &&
                                      controller.getPersen2() == 0 &&
                                      controller.getPersen3() == 0 &&
                                      controller.getPersen4() == 0
                                  ? Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 95, 128, 149),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Tidak Ada Kasus",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    )
                                  : PieChartSample3(
                                      valuePersen1: controller.getPersen1(),
                                      valuePersen2: controller.getPersen2(),
                                      valuePersen3: controller.getPersen3(),
                                      valuePersen4: controller.getPersen4(),
                                    ),
                              const SizedBox(height: 20),
                              GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  bullyingCard(
                                    persenIcident:
                                        "${controller.getPersen1().toStringAsFixed(2)}",
                                    title: 'Penindasan Fisik',
                                    color: AppColors.contentColorBlue,
                                    sumIcident: controller
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
                                        "${controller.getPersen2().toStringAsFixed(2)}",
                                    title: 'Penindasan Verbal',
                                    color: AppColors.contentColorYellow,
                                    sumIcident: controller
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
                                        "${controller.getPersen3().toStringAsFixed(2)}",
                                    title: 'Penindasan Non Verbal',
                                    color: AppColors.contentColorPurple,
                                    sumIcident: controller
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
                                        "${controller.getPersen4().toStringAsFixed(2)}",
                                    title: 'Penindasan Sexsual',
                                    color: AppColors.contentColorGreen,
                                    sumIcident: controller
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
                          ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PieChartSample3 extends StatefulWidget {
  final double valuePersen1;
  final double valuePersen2;
  final double valuePersen3;
  final double valuePersen4;
  PieChartSample3({
    super.key,
    required this.valuePersen1,
    required this.valuePersen2,
    required this.valuePersen3,
    required this.valuePersen4,
  });

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(
                valuePersen1: widget.valuePersen1,
                valuePersen2: widget.valuePersen2,
                valuePersen3: widget.valuePersen3,
                valuePersen4: widget.valuePersen4),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      {required double valuePersen1,
      required double valuePersen2,
      required double valuePersen3,
      required double valuePersen4}) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: valuePersen1,
            title: '${valuePersen1.toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: valuePersen2,
            title: '${valuePersen2.toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: valuePersen3,
            title: '${valuePersen3.toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );

        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: valuePersen4,
            title: '${valuePersen4.toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
