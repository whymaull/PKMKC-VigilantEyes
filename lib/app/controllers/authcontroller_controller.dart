// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/app/data/entities/client_entity.dart';
import 'package:vigilanteyes/app/data/entities/user.dart';
import 'package:vigilanteyes/app/data/repositories/client_repository.dart';
import 'package:vigilanteyes/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _clientRepository = ClientRepository();
  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  // Future<void> signUp({
  //   required String email,
  //   required String password,
  //   required String name,
  //   required String phone,
  //   required String address,
  //   required String userName,
  // }) async {
  //   try {
  //     Get.dialog(
  //       const Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false,
  //     );

  //     final UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     UserModel user = UserModel(
  //       password: password,
  //       email: email,
  //       phone: phone,
  //       name: name,
  //       address: address,
  //       uuid: userCredential.user!.uid,
  //     );

  //     // Set user data to Firestore
  //     CollectionReference filesCollection =
  //         FirebaseFirestore.instance.collection('users');
  //     await filesCollection.doc(userCredential.user!.uid).set(user.toJson());

  //     await _clientRepository.postData(
  //       // tokenClient: LocalDb.fcmToken,
  //       dateOFBirth: DateTime.now(),
  //       gender: "male",
  //       image: "",
  //       name: name,
  //       address: address,
  //       phone: "${phone}",
  //       email: email,
  //       password: password,
  //       uuid: userCredential.user!.uid,
  //       userName: userName,
  //     );

  //     LocalDb.loggedIn = true;
  //     LocalDb.loggedInClient = true;
  //     Get.back(); // Close loading dialog

  //     // Navigate to Dashboard
  //     Get.offAllNamed(Routes.DASHBOARDCLIENT);

  //     // Show a success snackbar
  //     Get.snackbar('Berhasil', 'Registrasi berhasil');
  //   } catch (e) {
  //     Get.back(); // Close loading dialog

  //     if (e is FirebaseException) {
  //       // Handle specific Firebase Auth errors
  //       if (e.code == 'weak-password') {
  //         Get.snackbar('Error', 'Password terlalu lemah');
  //       } else if (e.code == 'email-already-in-use') {
  //         Get.snackbar('Error', 'Email sudah terdaftar');
  //       } else {
  //         Get.snackbar(
  //             'Error', e.message ?? 'Terjadi kesalahan saat registrasi');
  //       }
  //     } else {
  //       // Handle other generic errors
  //       print('pesan error ${e.toString()}');
  //       Get.snackbar('Error', e.toString());
  //     }
  //   }
  // }

  Future<void> signIn(String email, String password) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // final clientRepo = ClientRepository();
      // final agentRepo = AgentRepository();
      // var uuid = FirebaseAuth.instance.currentUser!.uid;
      // print(uuid);

      // String token = LocalDb.fcmToken;
      // print(token);

      // ClientEntity? resultUserClient = await clientRepo.findByUuid(uuid);
      // AgentEntity? resultAgent = await agentRepo.findByUUID(uuid);
      // if (resultAgent != null) {
      //   bool isUpdateTokenAgent = await agentRepo.updateAgent(
      //     id: resultAgent.id,
      //     tokenAgent: token,
      //   );
      //   print(resultAgent.id);
      // } else {
      //   // Handle the case when there is no agent found for the user
      //   print('No agent found for this user.');
      // }

      // if (resultUserClient != null) {
      //   bool isUpdated = await clientRepo.updateClient(
      //     id: resultUserClient.id,
      //     tokenClient: token,
      //   );
      //   print(resultUserClient.id);
      // }

      // print("ini agent id $isUpdateTokenAgent ini nya  $token");
      // print("ini agent id $isUpdated ini nya  $token");

      Get.back(); // Tutup dialog loading
      if (email == "admin@gmail.com") {
        LocalDb.loggedAdmin = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.DASHBOARD_SCHOOL);
        LocalDb.loggedClient = true;
      }
      LocalDb.repeat = true;

      Get.snackbar('Berhasil', 'Login berhasil');
    } catch (e) {
      // Tangani kesalahan
      if (email.isEmpty && password.isEmpty) {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', 'Email dan password tidak boleh kosong');
      } else if (email.isEmpty) {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', 'Email tidak boleh kosong');
      } else if (password.isEmpty) {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', 'Password tidak boleh kosong');
      } else if (e.toString().contains('wrong-password')) {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', 'Password salah');
      } else if (e.toString().contains('user-not-found')) {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', 'Email tidak terdaftar');
      } else {
        Get.back(); // Tutup dialog loading
        Get.snackbar('Error', e.toString());
      }
    }
  }

  Future<void> signOut() async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      await _auth.signOut();
      LocalDb.loggedAdmin = false;
      LocalDb.repeat = true;
      Get.offAllNamed(Routes.LOGIN);

      Get.back(); // Tutup dialog loading
      Get.snackbar('Berhasil', 'Logout berhasil');
    } catch (e) {
      // Tangani kesalahan
      Get.back(); // Tutup dialog loading
      Get.snackbar('Error', e.toString());
    }
  }
}
