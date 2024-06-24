import 'package:flutter/material.dart';

class bullyingCard extends StatelessWidget {
  final String title;
  final Color color;

  const bullyingCard({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              '25',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("38.89%"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sebulan Terakhir',
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
