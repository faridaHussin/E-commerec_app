import 'package:dartz/dartz.dart';
import 'package:ecommerec_app/data/api/api_manager.dart';
import 'package:ecommerec_app/data/api/base_error.dart';
import 'package:ecommerec_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerec_app/domain/repository/data_sources/auth_remot_data_sources.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSources {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String phone, String password, String rePassword) async {
    var either =
        await apiManager.register(name, email, phone, password, rePassword);
    return either.fold((error) {
      return Left(BaseError(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.otAuthResultEntity());
    });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((error) {
      return Left(BaseError(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.otAuthResultEntity());
    });
  }
}
