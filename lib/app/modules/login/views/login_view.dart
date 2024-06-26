import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/button.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                'assets/login.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Stay informed about bullying\nincidence in your school',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
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
                title: "Log In",
                tinggiTombol: 56,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Sign up',
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
