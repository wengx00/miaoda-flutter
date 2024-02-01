import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JsonPrefs {
  static get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key);
    if (raw != null) return jsonDecode(raw);
    return null;
  }

  static Future<bool> set(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, jsonEncode(value));
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
