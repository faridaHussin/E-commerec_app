import 'package:ecommerec_app/data/model/response/UserDto.dart';

import '../../../domain/entities/auth_result_entity.dart';

/// message : "success"
/// user : {"name":"amira","email":"amira@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NjI0ZTkyNTI1ZWEyMmQyMzM2YTU2ZCIsIm5hbWUiOiJhbWlyYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAwOTQ4NjM3LCJleHAiOjE3MDg3MjQ2Mzd9.RQrM51chUEH2bPOFn3eJCJ98-TlqQib1SaLA0SdfYRU"

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity otAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity(),
    );
  }
}

/// name : "amira"
/// email : "amira@route.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
