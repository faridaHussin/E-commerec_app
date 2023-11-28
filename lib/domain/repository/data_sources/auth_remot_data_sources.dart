import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';

import '../../../data/api/base_error.dart';
import '../../../data/model/response/RegisterResponse.dart';

abstract class AuthRemoteDataSources {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String phone, String password, String rePassword);

  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
