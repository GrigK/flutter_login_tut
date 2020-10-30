import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// имитация процесса авторизации на сервере
  /// в реальности возможно понадобятся: [http] или [dio]
  /// а также [hivo] или [flutter_secure_storage]

  /// получить токен авторизации на сервере
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    // final SharedPreferences prefs = await _prefs;
    //
    // await prefs.setString("user", username);
    // await prefs.setString("pass", password);

    return 'token';
  }

  /// удалить из хранилища токен keystore/keychain
  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
  }

  /// записать токен в хранилище keystore/keychain
  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
  }

  /// прочесть токен из хранилища keystore/keychain
  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
