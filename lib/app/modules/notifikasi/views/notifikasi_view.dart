import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/notifikasi_card.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          NotificationItem(
            message: 'ALERT: Physical bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Verbal bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Physical bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Non-Verbal bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Sexual bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Physical bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Physical bullying reported.',
          ),
          NotificationItem(
            message: 'ALERT: Physical bullying reported.',
          ),
        ],
      ),
    );
  }
}
