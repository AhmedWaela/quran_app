import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SharedPreferenceAdapter implements StorageService {
  final SharedPreferences _sharedPreferencesPlugin;

  const SharedPreferenceAdapter(this._sharedPreferencesPlugin);

  @override
  Future<void> save<T>(String key, T value) async {
    if (value is String) {
      await _sharedPreferencesPlugin.setString(key, value);
    } else if (value is int) {
      await _sharedPreferencesPlugin.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferencesPlugin.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferencesPlugin.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferencesPlugin.setStringList(key, value);
    } else {
      throw UnsupportedError(
          "Type ${value.runtimeType} is not supported by SharedPreferenceAdapter");
    }
  }

  @override
  T? get<T>(String key) {
    final dynamic value = _sharedPreferencesPlugin.get(key);
    if (value == null) {
      return null;
    }
    return value as T;
  }
}

class HiveAdapter implements StorageService {
  @override
  Future<void> save<T>(String key, T value, {String? boxName}) async {
    var box = Hive.box<T>(boxName!);
    await box.put(key, value);
  }

  @override
  T? get<T>(String key, {String? boxName}) {
    if (!Hive.isBoxOpen(boxName!)) {
      debugPrint("⚠️ Box '$boxName' is not open yet!");
      return null;
    }
    var box = Hive.box<T>(boxName);
    return box.get(key);
  }
}
