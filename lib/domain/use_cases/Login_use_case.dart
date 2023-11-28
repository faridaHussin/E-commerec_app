import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';

import '../repository/repository/auth_repositoy.dart';

class LoginUseCase {
  AuthRepositoy authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<BaseError, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
