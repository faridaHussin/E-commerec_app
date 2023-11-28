import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerec_app/domain/repository/data_sources/auth_remot_data_sources.dart';
import 'package:ecommerec_app/domain/repository/repository/auth_repositoy.dart';

class AuthRepositoryImpl extends AuthRepositoy {
  AuthRemoteDataSources remoteDataSources;

  AuthRepositoryImpl({required this.remoteDataSources});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String phone, String password, String rePassword) {
    return remoteDataSources.register(name, email, phone, password, rePassword);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSources.login(email, password);
  }
}
