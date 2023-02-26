import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hardwareandro_login/core/auth_manager.dart';
import 'package:hardwareandro_login/core/cache_manager.dart';
import 'package:hardwareandro_login/home/home_view.dart';
import 'package:hardwareandro_login/home/user_model.dart';
import 'package:hardwareandro_login/screens/login/login.dart';
import 'package:hardwareandro_login/screens/login/model/user_request_model.dart';
import 'package:hardwareandro_login/screens/login/service/login_service.dart';
import 'package:provider/provider.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
 // final _baseUrl = 'https://reqres.in';
  final _baseUrl = 'http://isacanapi.tuzlatest.com';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginService = LoginService(Dio(BaseOptions(baseUrl: _baseUrl)));
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(username: email, password: password));
    print(response);
    if(response!=null){
      saveToken(response.accessToken ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome(){
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HomeView()));
  }
}
