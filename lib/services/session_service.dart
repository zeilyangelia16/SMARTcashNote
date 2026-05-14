import 'package:shared_preferences/shared_preferences.dart';

class SessionData {
  final bool isLogin;
  final int userId;
  final String userName;
  final String userEmail;

  const SessionData({
    required this.isLogin,
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  bool get hasValidSession => isLogin && userId > 0;
}

class SessionService {
  static const String _keyIsLogin = 'isLogin';
  static const String _keyUserId = 'userId';
  static const String _keyUserName = 'userName';
  static const String _keyUserEmail = 'userEmail';

  static Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await _prefs();
    return prefs.getBool(_keyIsLogin) ?? false;
  }

  static Future<SessionData> getSession() async {
    final prefs = await _prefs();
    return SessionData(
      isLogin: prefs.getBool(_keyIsLogin) ?? false,
      userId: prefs.getInt(_keyUserId) ?? 0,
      userName: prefs.getString(_keyUserName) ?? '',
      userEmail: prefs.getString(_keyUserEmail) ?? '',
    );
  }

  static Future<void> saveSession({
    required int userId,
    required String userName,
    required String userEmail,
  }) async {
    final prefs = await _prefs();
    await prefs.setBool(_keyIsLogin, true);
    await prefs.setInt(_keyUserId, userId);
    await prefs.setString(_keyUserName, userName);
    await prefs.setString(_keyUserEmail, userEmail);
  }

  static Future<void> clearSession() async {
    final prefs = await _prefs();
    await prefs.remove(_keyIsLogin);
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyUserName);
    await prefs.remove(_keyUserEmail);
  }
}
