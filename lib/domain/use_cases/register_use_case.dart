import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';

import '../repository/repository/auth_repositoy.dart';

class RegisterUseCase {
  AuthRepositoy authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email,
      String phone, String password, String rePassword) {
    return authRepository.register(name, email, phone, password, rePassword);
  }
}
