import 'package:flutter/material.dart';

class widgetButton extends StatelessWidget {
  final String title;
  final double tinggiTombol;

  const widgetButton({
    Key? key,
    required this.title,
    required this.tinggiTombol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: tinggiTombol,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
