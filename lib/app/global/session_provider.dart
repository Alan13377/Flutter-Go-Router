import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sessionProvider = Provider((ref) async {
  return SessionProvider(await SharedPreferences.getInstance());
});

class SessionProvider {
  late bool _isSignedIn;
  final SharedPreferences _preferences;
  SessionProvider(this._preferences) {
    _isSignedIn = _preferences.getBool("session") ?? false;
  }
  bool get isSignedIn => _isSignedIn;

  void setSignedIn(bool value) {
    _isSignedIn = value;
    _preferences.setBool("session", value);
  }
}
