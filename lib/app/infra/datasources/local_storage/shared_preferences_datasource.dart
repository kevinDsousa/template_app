import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageDatasource {
  Future<bool> delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  Future put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    }
  }
}
