import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String message;

  const NotificationItem({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.black),
        title: Text(message),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Add your onTap functionality here
        },
      ),
    );
  }
}
