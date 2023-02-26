import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hardwareandro_login/screens/login/model/user_request_model.dart';
import 'package:hardwareandro_login/screens/login/model/user_response_model.dart';

abstract class ILoginService {
//  final String path = "/api/login";
  final String path = "/uyegirisi";

  ILoginService(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);

  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(
      path,
      options: Options(headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Host": "isacanapi.tuzlatest.com",
        "Content-Length": "57"
      }),
      data: model,
    );
    try {
      if (response.statusCode == HttpStatus.ok) {
        return UserResponseModel.fromJson(response.data);
      } else {
        print(response);
        return null;
      }
    } catch (e) {
      print(response.data);
      print(e);
    }
  }
}
