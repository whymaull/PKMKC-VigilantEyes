import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalDb.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VigilantEyes",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set background color to white
      ),
    ),
  );
}
