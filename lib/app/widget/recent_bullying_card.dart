import 'package:flutter/material.dart';

class recentBullying extends StatelessWidget {
  final String className;
  final String type;
  final String date;
  final String imagePath;
  final Function()? klik;

  const recentBullying({
    Key? key,
    required this.className,
    required this.type,
    required this.date,
    required this.imagePath,
    this.klik,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: ClipRRect(
              child: SizedBox(
                child: Image.asset(
                  imagePath,
                  width: 90,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              className,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type),
                Text(date),
              ],
            ),
            onTap: klik,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
