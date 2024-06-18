import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';

import '../controllers/school_home_controller.dart';

class SchoolHomeView extends GetView<SchoolHomeController> {
  const SchoolHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 200,
              color: Colors.grey[200],
              child: const Center(child: Text('Grafik Bullying di sini')),
            ),
            const SizedBox(height: 20),
            const Text(
              'Types of bullying',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            bullyingCard(title: 'Physical Bullying'),
            bullyingCard(title: 'Verbal Bullying'),
            bullyingCard(title: 'Non-Verbal Bullying'),
            bullyingCard(title: 'Sexual Bullying'),
          ],
        ),
      ),
    );
  }
}
