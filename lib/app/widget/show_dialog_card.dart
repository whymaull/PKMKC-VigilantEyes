import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowDialogCard extends StatelessWidget {
  final Function()? onTap;
  TextEditingController? controller;

  ShowDialogCard({super.key, this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text('Masuk'),
        )
      ],
      title: const Text('Masukan Kata Sandi'),
      contentPadding: const EdgeInsets.all(16),
      content: TextFormField(
        controller: controller,
      ),
    );
  }
}
