import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static SharedPrefsService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPrefsService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefsService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  dynamic getFromDisk(String key) {
    var value = _preferences!.get(key);
    log('(TRACE) SharedPrefsService:_getFromDisk. key: $key value: $value');
    return value;
  }

  Future<void> saveToDisk<T>(String key, T content) async {
    log('(TRACE) SharedPrefsService: _saveToDisk. key: $key value: $content');

    if (content is String) {
      await _preferences!.setString(key, content);
    }
    if (content is bool) {
      await _preferences!.setBool(key, content);
    }
    if (content is int) {
      await _preferences!.setInt(key, content);
    }
    if (content is double) {
      await _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences!.setStringList(key, content);
    }
  }

  Future<bool> clearDisk() async {
    return await _preferences!.clear();
  }
}
