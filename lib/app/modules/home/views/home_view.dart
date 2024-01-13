import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/list_school.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search School',
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
                padding: EdgeInsets.only(top: 26, bottom: 16),
                child: Text(
                  'Select School',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListSchool(
                      title: 'Sekolah 1',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 2',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 3',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 4',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 5',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 6',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 7',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 8',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 9',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 10',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 11',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'Sekolah 12',
                      imagePath: 'assets/logo.png',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
