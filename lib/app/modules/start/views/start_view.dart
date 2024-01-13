import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: const Text(
                        'VigilantEyes',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 36, right: 36, top: 24),
                      child: const Text(
                        'Monitor and report bullying Incidents in real-time!',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Image.asset('assets/start.png'),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'View Incidents',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.OPTIONMENU);
                    },
                  ),
                ),
              ),
              const Expanded(
                flex: 0,
                child: SizedBox(
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
