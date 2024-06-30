import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/controllers/authcontroller_controller.dart';
import 'package:vigilanteyes/app/widget/CusButton.dart';
import 'package:vigilanteyes/app/widget/input_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final AuthController _controller = Get.put(AuthController());

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/login.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pantau dan cegah insiden perundungan dengan CCTV AI!',
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
                        iconTextField: const Icon(Icons.email),
                      )),
                  const SizedBox(height: 20),
                  Obx(() => InputTextField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: controller.validatePassword,
                        obscureText: controller.isObscure.value,
                        controller: controller.passwordController!.value,
                        title: "Masukkan Password Anda",
                        iconTextField: InkWell(
                          onTap: () {
                            controller.toggleObscure();
                          },
                          child: Icon(
                            controller.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                  CusButton(
                    pad: 100,
                    title: "Log In",
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        _controller.signIn(
                            controller.emailController!.value.text,
                            controller.passwordController!.value.text);
                      } else {
                        if (kDebugMode) {
                          print("ini false");
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
