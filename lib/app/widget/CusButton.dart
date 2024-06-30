// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CusButton extends StatelessWidget {
  final String title;
  final double pad;
  final Function()? onTap;

  const CusButton({
    Key? key,
    required this.title,
    this.onTap,
    required this.pad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
