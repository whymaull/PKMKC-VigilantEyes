import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:vigilanteyes/app/controllers/firebase_api.dart';
import 'package:vigilanteyes/app/core/services/local_db.dart';
import 'package:vigilanteyes/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("7011f638-160e-4380-ad37-3c67553ff3e9");
  OneSignal.Notifications.requestPermission(true);

  await LocalDb.init();

  if (kDebugMode) {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
    await FirebaseInAppMessaging.instance.setMessagesSuppressed(false);
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VigilantEyes",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set background color to white
      ),
    ),
  );
}
