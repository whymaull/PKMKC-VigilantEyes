import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/controllers/authcontroller_controller.dart';
import 'package:vigilanteyes/app/widget/bullying_type_card.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthController _controller = Get.put(AuthController());

  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Budi Anduk"),
              subtitle: Text("SMKN 15"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("50"),
                  Text("Kejadian"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Ubah Profile"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.dialog<bool>(
                            AlertDialog(
                              title: const Text('Keluar'),
                              content: const Text(
                                'Ingin keluar dari akun Anda?',
                              ),
                              actions: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff5CE1E6)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: TextButton(
                                    onPressed: () => Get.back(result: false),
                                    child: Text(
                                      'Batal',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xff5CE1E6)),
                                  child: TextButton(
                                    onPressed: () {
                                      _controller.signOut();
                                      // controller.logOut();
                                    },
                                    child: Text(
                                      'Ya, Keluar',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text("Keluar"),
                      ),
                    ],
                  ),
                  Text("Kejadian"),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10),
                    itemBuilder: (context, index) => bullyingCard(
                      title: 'Penindasan Fisik',
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
