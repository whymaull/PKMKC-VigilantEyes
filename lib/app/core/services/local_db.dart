import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get repeat => _prefs.getBool('repeat') ?? false;
  static String get idSchool => _prefs.getString('id_school') ?? '';
  static bool get loggedAdmin => _prefs.getBool('logged_in') ?? false;
  static bool get loggedClient => _prefs.getBool('logged_in_client') ?? false;
  static String get fcmToken => _prefs.getString('fcm_token') ?? '';
  static set fcmToken(String token) => _prefs.setString('fcm_token', token);
  static set idSchool(String id) => _prefs.setString('id_school', id);

  static set repeat(bool value) => _prefs.setBool('repeat', value);
  static set loggedAdmin(bool value) => _prefs.setBool('logged_in', value);
  static set loggedClient(bool value) =>
      _prefs.setBool('logged_in_client', value);
}
