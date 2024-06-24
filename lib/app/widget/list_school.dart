import 'package:flutter/material.dart';

class ListSchool extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function()? onTap;

  ListSchool(
      {Key? key, required this.title, required this.imagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Warna bayangan
            blurRadius: 10, // Radius blur bayangan
            offset: Offset(0, 0), // Perpindahan bayangan
          ),
        ],
        color: Colors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fill)),
              ),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
