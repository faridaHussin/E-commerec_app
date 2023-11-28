import 'package:ecommerec_app/ui/auth/register/cubit/RegisterStates.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/Login_use_case.dart';
import 'LoginStates.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  var forKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;

  void login() async {
    if (forKey.currentState?.validate() == true) {
      var either = await loginUseCase.invoke(
        email.text,
        password.text,
      );
      either.fold((error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
