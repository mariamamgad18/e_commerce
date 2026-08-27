import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static late SharedPreferences sharedprefs;

  // =========================
  // INITIALIZE
  // =========================

  static Future<void> init() async {
    sharedprefs = await SharedPreferences.getInstance();
  }

  // =========================
  // SAVE DATA
  // =========================

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedprefs.setInt(key, value);
    }

    if (value is double) {
      return await sharedprefs.setDouble(key, value);
    }

    if (value is String) {
      return await sharedprefs.setString(key, value);
    }

    if (value is bool) {
      return await sharedprefs.setBool(key, value);
    }

    return false;
  }

  // =========================
  // GET DATA
  // =========================

  static Object? getData({required String key}) {
    return sharedprefs.get(key);
  }

  // =========================
  // GET STRING
  // =========================

  static String? getString({required String key}) {
    final value = sharedprefs.get(key);

    if (value is String) {
      return value;
    }

    return null;
  }

  // =========================
  // GET INT
  // =========================

  static int? getInt({required String key}) {
    final value = sharedprefs.get(key);

    if (value is int) {
      return value;
    }

    return null;
  }

  // =========================
  // GET BOOL
  // =========================

  static bool? getBool({required String key}) {
    final value = sharedprefs.get(key);

    if (value is bool) {
      return value;
    }

    return null;
  }

  // =========================
  // REMOVE DATA
  // =========================

  static Future<bool> removeData({required String key}) async {
    return await sharedprefs.remove(key);
  }
}
