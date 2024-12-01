import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _sessionManager = SessionManager.internal();

  factory SessionManager() => _sessionManager;

  SessionManager.internal();

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
String token="token";

  set tokenVal(String val) => sharedPreferences.setString(token, val);
  String get tokenVal => sharedPreferences.getString(token) ?? "";
}