import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowDialogCard extends StatelessWidget {
  final Function()? onTap;

  const ShowDialogCard({super.key, this.onTap});

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
      content: TextField(),
    );
  }
}
