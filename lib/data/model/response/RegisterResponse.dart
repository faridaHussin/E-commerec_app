import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';

import 'UserDto.dart';
import 'Error.dart';

/// message : "success"
/// user : {"name":"omar khaled","email":"omarkhaled@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGJlYWQwMjE0MWJmMzExZjBiMWJjOSIsIm5hbWUiOiJvbWFyIGtoYWxlZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NDc0MTI4LCJleHAiOjE3MDcyNTAxMjh9.GRv4tYUaym0rhHkThu6EyoZdehCZLhfZqqQhyzgDPD4"

class RegisterResponse {
  RegisterResponse(
      {this.message, this.user, this.token, this.statusMsg, this.error});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity otAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
