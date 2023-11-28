import 'package:ecommerec_app/data/api/api_manager.dart';
import 'package:ecommerec_app/data/repository/data_sources/auth_remote_data_source_impl.dart';
import 'package:ecommerec_app/data/repository/repository/auth_repository_impl.dart';
import 'package:ecommerec_app/domain/repository/data_sources/auth_remot_data_sources.dart';
import 'package:ecommerec_app/domain/repository/repository/auth_repositoy.dart';
import 'package:ecommerec_app/domain/use_cases/register_use_case.dart';

import '../domain/use_cases/Login_use_case.dart';

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepositoy injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSources: injectAuthRemoteDataSources());
}

AuthRemoteDataSources injectAuthRemoteDataSources() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
