import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPlugin {
  static late SharedPreferences _sharedPreferences;

  static SharedPreferences get instance => _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
