import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static final SpHelper spHelper = SpHelper();

  SharedPreferences sharedPreferences;

  initSharedPrefernces() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setStringValue(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  setIntValue(String key, int value) {
    sharedPreferences.setInt(key, value);
  }

  setBoolValue(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  String getStringValue(String key) {
    String value = sharedPreferences.getString(key);
    //If key not found return empty string
    return value ?? "";
  }

  int getIntValue(String key) {
    int value = sharedPreferences.getInt(key);
    //If key not found return 0
    return value ?? 0;
  }

  bool getBoolValue(String key) {
    bool value = sharedPreferences.getBool(key);
    //If key not found return false
    return value ?? false;
  }

  clearSharedPref() async {
    await sharedPreferences.clear();
  }
}
