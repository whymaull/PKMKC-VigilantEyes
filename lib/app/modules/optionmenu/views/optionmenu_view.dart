import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/optionmenu_controller.dart';

class OptionmenuView extends GetView<OptionmenuController> {
  const OptionmenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'OptionmenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
