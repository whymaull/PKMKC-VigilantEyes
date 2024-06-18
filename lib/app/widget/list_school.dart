import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSchool extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function()? onTap;

  ListSchool(
      {Key? key, required this.title, required this.imagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(38),
          child: SizedBox(
            width: 80,
            height: 180,
            child: Image.asset(
              imagePath,
              width: 90,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
