import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/list_school.dart';

import '../controllers/school_cctv_controller.dart';

class SchoolCCTVView extends GetView<SchoolCCTVController> {
  const SchoolCCTVView({Key? key}) : super(key: key);
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
              Expanded(
                child: ListView(
                  children: const [
                    ListSchool(
                      title: 'CCTV Kelas 1',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kelas 2',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kelas 3',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kelas 4',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kelas 5',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kelas 6',
                      imagePath: 'assets/logo.png',
                    ),
                    ListSchool(
                      title: 'CCTV Kantin',
                      imagePath: 'assets/logo.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {},
      ),
    );
  }
}
