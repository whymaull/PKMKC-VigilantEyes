import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';
import 'package:vigilanteyes/app/widget/recent_bullying_card.dart';

import '../controllers/recent_controller.dart';

class RecentView extends GetView<RecentController> {
  const RecentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    'Recent bullying',
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
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                children: [
                  recentBullying(
                      imagePath: 'assets/logo.png',
                      className: 'Class VII',
                      type: 'Verbal bullying',
                      date: '12 Januari 2024'),
                  recentBullying(
                      imagePath: 'assets/logo.png',
                      className: 'Class III',
                      type: 'Verbal bullying',
                      date: '05 Januari 2024'),
                  recentBullying(
                      imagePath: 'assets/logo.png',
                      className: 'Class IV',
                      type: 'Physical bullying',
                      date: '20 Desember 2023'),
                  recentBullying(
                      imagePath: 'assets/logo.png',
                      className: 'Class V',
                      type: 'Verbal bullying',
                      date: '15 Desember 2023'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
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
