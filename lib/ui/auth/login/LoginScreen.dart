import 'package:ecommerec_app/data/id.dart';
import 'package:ecommerec_app/ui/auth/login/cubit/LoginStates.dart';
import 'package:ecommerec_app/ui/auth/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/TextFieldItem.dart';
import '../../utils/dialog_utils.dart';
import 'cubit/LoginScreenViewModel.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.response.userEntity?.name ?? "",
              title: 'Success', posActionName: 'Ok');
        }
      },
      child: Scaffold(
        body: Container(
          color: theme.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/images/route.png'),
                ),
                Text(
                  "Welcome Back To Rout",
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontSize: 24, color: Colors.white),
                ),
                Text(
                  "Please sign in with your mail",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                Form(
                  key: viewModel.forKey,
                  child: Column(
                    children: [
                      TextFieldItem(
                        fieldName: 'E-mail address',
                        hintText: 'enter your email address',
                        controller: viewModel.email,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter email address';
                          }
                          bool emailVaild = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value);
                          if (!emailVaild) {
                            return 'invalid email';
                          }
                          return null;
                        },
                      ),
                      TextFieldItem(
                        fieldName: 'password',
                        hintText: 'enter your password',
                        controller: viewModel.password,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter password';
                          }
                          if (value.trim().length < 6 ||
                              value.trim().length > 30) {
                            return 'password should be >6 & <30';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: viewModel.isObscure,
                        suffixIcon: InkWell(
                          child: viewModel.isObscure
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onTap: () {
                            if (viewModel.isObscure) {
                              viewModel.isObscure = false;
                            } else {
                              viewModel.isObscure = true;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Forget Password",
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                    ),
                    child: Container(
                      height: 64.h,
                      width: 398.w,
                      child: Center(
                        child: Text(
                          "Login",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: theme.textTheme.titleMedium,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                        child: Text(
                          'Create Account',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
