import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/button.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  const DaftarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/regist.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              const inputTextField(
                title: "Masukkan Nama Anda",
                iconTextField: Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              const inputTextField(
                title: "Masukkan Email Anda",
                iconTextField: Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              const inputTextField(
                title: "Masukkan Password Anda",
                iconTextField: Icon(Icons.lock),
              ),
              const SizedBox(height: 30),
              const widgetButton(
                title: "Sign Up",
                tinggiTombol: 56,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
