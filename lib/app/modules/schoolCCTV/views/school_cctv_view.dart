import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/widget/list_school.dart';

import '../controllers/school_cctv_controller.dart';

class SchoolCCTVView extends GetView<SchoolCCTVController> {
  const SchoolCCTVView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search CCTV by Class',
                    hintStyle: const TextStyle(fontSize: 16),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.only(left: 24),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 16),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListSchool(
                      title: 'CCTV Kelas 10',
                      imagePath: 'assets/logo.png',
                    );
                  },
                ),
              )
              // Expanded(
              //   child: ListView(
              //     children: [

              //       ListSchool(
              //         title: 'CCTV Kelas 2',
              //         imagePath: 'assets/logo.png',
              //       ),
              //       ListSchool(
              //         title: 'CCTV Kelas 3',
              //         imagePath: 'assets/logo.png',
              //       ),
              //       ListSchool(
              //         title: 'CCTV Kelas 4',
              //         imagePath: 'assets/logo.png',
              //       ),
              //       ListSchool(
              //         title: 'CCTV Kelas 5',
              //         imagePath: 'assets/logo.png',
              //       ),
              //       ListSchool(
              //         title: 'CCTV Kelas 6',
              //         imagePath: 'assets/logo.png',
              //       ),
              //       ListSchool(
              //         title: 'CCTV Kantin',
              //         imagePath: 'assets/logo.png',
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void showPasswordDialog(BuildContext context) {
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password'),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Handle password confirmation here
                print('Password entered: ${passwordController.text}');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
