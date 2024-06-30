import 'package:flutter/material.dart';

class RecentBullying extends StatelessWidget {
  final String className;
  final String type;
  final String date;
  final String imagePath;
  final Function()? klik;

  const RecentBullying({
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
        Container(
          margin:
              const EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1), // Warna bayangan
                )
              ]),
          child: ListTile(
            leading: Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imagePath), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
