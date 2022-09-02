import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<bool?> getBool(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static Future saveBool(String key, bool value) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setBool(key, value);
  }

  static Future<String?> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future saveString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString(key, value);
  }

  static Future saveJson(String key, dynamic value) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString(key, value);
  }

  static Future<String?> getJson(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static deleteValue(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
