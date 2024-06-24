import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/data/entities/user_entity.dart';
import 'package:vigilanteyes/app/data/repositories/user_repository.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  UserEntity? resultUser;

  fetchUserClientByUuid() async {
    isLoading.value = true;
    var index = FirebaseAuth.instance.currentUser!.uid;
    debugPrint(index);

    final user = UserRepository();
    resultUser = await user.findByUUID(index);

    isLoading.value = false;
  }
}
