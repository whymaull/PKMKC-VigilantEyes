import 'package:flutter/material.dart';

class widgetButton extends StatelessWidget {
  final String title;
  final double tinggiTombol;
  final Function()? onTap;

  const widgetButton({
    Key? key,
    required this.title,
    required this.tinggiTombol,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
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
          onPressed: onTap,
        ),
      ),
    );
  }
}
