import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  var FAKE_STORE_SESSIONS = "MCQ_SESSIONS_USER_";
  var TOKEN = "TOKEN";

  Future<void> saveUserID(var token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(FAKE_STORE_SESSIONS + TOKEN, token);
  }

  Future<String?> getUserID() async {
    final prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString(FAKE_STORE_SESSIONS + TOKEN);
    return token;
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(FAKE_STORE_SESSIONS + TOKEN);
  }
}
