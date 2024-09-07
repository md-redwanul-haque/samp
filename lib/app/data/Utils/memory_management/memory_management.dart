import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setInteger(String key, int value) {
    _prefs?.setInt(key, value);
  }

  static int getInteger(String key) {
    return _prefs?.getInt(key) ?? 0;
  }

  static void setDouble(String key, double value) {
    _prefs?.setDouble(key, value);
  }

  static double getDouble(String key) {
    return _prefs?.getDouble(key) ?? 0.0;
  }

  static void setString(String key, String value) {
    _prefs?.setString(key, value);
  }

  static String getString(String key) {
    return _prefs?.getString(key) ?? 'DEFAULT_VALUE';
  }

  static void setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  static Future<void> saveData(String key, dynamic value) async {
    if (_prefs != null) {
      if (value is int) {
        await _prefs!.setInt(key, value);
      } else if (value is String) {
        await _prefs!.setString(key, value);
      } else if (value is bool) {
        await _prefs!.setBool(key, value);
      } else if (value is double) {
        await _prefs!.setDouble(key, value);
      } else {
        print("Invalid Type");
      }
    }
  }

  static dynamic readData(String key) {
    return _prefs?.get(key);
  }

  static Future<bool?> deleteData(String key) async {
    return _prefs?.remove(key);
  }
}
