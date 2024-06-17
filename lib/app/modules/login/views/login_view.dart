import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/controllers/authcontroller_controller.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';
import 'package:vigilanteyes/app/widget/button.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final AuthController _controller = Get.put(AuthController());

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
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
                  Obx(() => InputTextField(
                        validator: controller.validateName,
                        controller: controller.emailController!.value,
                        title: "Masukkan Email Anda",
                        iconTextField: Icon(Icons.email),
                      )),
                  const SizedBox(height: 20),
                  Obx(() => InputTextField(
                        validator: controller.validatePassword,
                        controller: controller.passwordController!.value,
                        title: "Masukkan Password Anda",
                        iconTextField: Icon(Icons.lock),
                      )),
                  const SizedBox(height: 30),
                  widgetButton(
                    title: "Log In",
                    tinggiTombol: 56,
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        _controller.signIn(
                            controller.emailController!.value.text,
                            controller.passwordController!.value.text);
                      } else {
                        print("ini false");
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("Don't have an account?"),
                  //     const SizedBox(width: 5),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: const Text(
                  //         'Sign up',
                  //         style: TextStyle(
                  //           color: Colors.blue,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
