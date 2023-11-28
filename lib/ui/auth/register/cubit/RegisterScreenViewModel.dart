import 'package:ecommerec_app/ui/auth/register/cubit/RegisterStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var forKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();
  bool isObscure = true;

  void register() async {
    if (forKey.currentState?.validate() == true) {
      var either = await registerUseCase.invoke(fullName.text, email.text,
          mobileNumber.text, password.text, confirmationPassword.text);
      either.fold((error) {
        emit(RegisterErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(RegiterSuccessState(response: response));
      });
    }
  }
}
