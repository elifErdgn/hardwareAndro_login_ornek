import 'package:flutter/cupertino.dart';
import 'package:hardwareandro_login/core/cache_manager.dart';
import 'package:hardwareandro_login/home/user_model.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;

  AuthenticationManager({
    required this.context,
  });

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
