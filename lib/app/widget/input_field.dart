import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final Icon? iconTextField;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const InputTextField({
    Key? key,
    required this.title,
    this.iconTextField,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        suffixIcon: iconTextField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.only(left: 24),
      ),
    );
  }
}
