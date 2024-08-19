import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  SharedPreferences sharedPreferences;
  AuthLocalDataSource({required this.sharedPreferences});

  Future<void> cacheToken(String Token) async {
    await sharedPreferences.setString("user", Token);
  }

  Future<String> getToken() async {
    final userToken = sharedPreferences.getString("user");
    if (userToken != null) {
      return userToken;
    } else {
      throw Exception("no user have logged in");
    }
  }
}
