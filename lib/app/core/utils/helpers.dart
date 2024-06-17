// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';
// import 'package:path/path.dart' as path;

// void pantau(dynamic value) => log(value.toString());

// String formatCurrency(int amount) {
//   var formatter =
//       NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
//   return formatter.format(amount);
// }

// String formatTimeInWIB(DateTime dateTime) {
//   // Convert to WIB (UTC +7) by adding 7 hours
//   dateTime = dateTime.add(Duration(hours: 7));

//   // Format the time in WIB
//   String formattedTime = DateFormat('HH:mm').format(dateTime);

//   return formattedTime;
// }

// String formatDateTimeInWIB(DateTime dateTime) {
//   // Convert to WIB (UTC +7) by adding 7 hours
//   dateTime = dateTime.add(Duration(hours: 7));

//   // Format the date and time in WIB
//   String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

//   return formattedDateTime;
// }

// Future<Position> getLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   bool denyAcces;
//   int requestCount = 0;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   denyAcces = [LocationPermission.denied, LocationPermission.deniedForever]
//       .contains(permission);

//   while (denyAcces) {
//     requestCount++;
//     print("OKE");
//     permission = await Geolocator.requestPermission();
//     denyAcces = [LocationPermission.denied, LocationPermission.deniedForever]
//         .contains(permission);

//     if (denyAcces && requestCount >= 3) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   return await Geolocator.getCurrentPosition();
// }

// //DM Sans W700
// const dmSans20w700 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 20,
//   fontWeight: FontWeight.w700,
// );
// const dmSans18w700 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 18,
//   fontWeight: FontWeight.w700,
// );
// const dmSans14w700 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 14,
//   fontWeight: FontWeight.w700,
// );
// const dmSans12w700 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 12,
//   fontWeight: FontWeight.w700,
// );
// //DM Sans W500
// const dmSans12w500 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 12,
//   fontWeight: FontWeight.w500,
// );
// const dmSans14w500 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 14,
//   fontWeight: FontWeight.w500,
// );
// const dmSans16w500 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 16,
//   fontWeight: FontWeight.w500,
// );

// //DM Sans W400
// const dmSans9w400 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 9,
//   fontWeight: FontWeight.w400,
// );
// const dmSans10w400 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 10,
//   fontWeight: FontWeight.w400,
// );
// const dmSans12w400 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 12,
//   fontWeight: FontWeight.w400,
// );
// const dmSans14w400 = TextStyle(
//   fontFamily: 'DM Sans',
//   fontSize: 14,
//   fontWeight: FontWeight.w400,
// );
// //Poppins W500
// const poppoins12w500 = TextStyle(
//   fontFamily: 'Poppins',
//   fontSize: 14,
//   fontWeight: FontWeight.w400,
// );

// String getFileName(String filePath) {
//   String fileName = path.basename(filePath);
//   return fileName;
// }
