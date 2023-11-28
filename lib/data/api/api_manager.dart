import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/api_constants.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/data/model/request/RegisterRequest.dart';
import 'package:ecommerec_app/data/model/response/LoginRequest.dart';
import 'package:ecommerec_app/data/model/response/LoginResponse.dart';
import 'package:ecommerec_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<BaseError, RegisterResponse>> register(String name,
      String email, String phone, String password, String rePassword) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var repquestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      var response = await http.post(url, body: repquestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(registerResponse);
      } else {
        return left(BaseError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message));
      }
    } else {
      return left(BaseError(errorMessage: "check internet connection"));
    }
  }

  Future<Either<BaseError, LoginResponseDto>> login(
      String email, String password) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var loginBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: loginBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(loginResponse);
      } else {
        return left(BaseError(errorMessage: loginResponse.message));
      }
    } else {
      return left(BaseError(errorMessage: "check internet connection"));
    }
  }
}
