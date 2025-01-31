import 'package:shared_preferences/shared_preferences.dart';

class prefs {
  static late SharedPreferences _insatance;
  static Future<void> init() async {
    _insatance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _insatance.setBool(key, value);
  }

  static getBool(String key) {
    return _insatance.getBool(key) ?? false;
  }
}
