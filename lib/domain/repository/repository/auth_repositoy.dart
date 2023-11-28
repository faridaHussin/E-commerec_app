import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';

abstract class AuthRepositoy {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String phone, String password, String rePassword);

  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
