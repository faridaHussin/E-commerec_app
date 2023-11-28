import 'package:ecommerec_app/data/id.dart';
import 'package:ecommerec_app/ui/auth/register/cubit/RegisterScreenViewModel.dart';
import 'package:ecommerec_app/ui/auth/register/cubit/RegisterStates.dart';
import 'package:ecommerec_app/ui/utils/TextFieldItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
        } else if (state is RegiterSuccessState) {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Form(
                        key: viewModel.forKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'Full Name',
                              hintText: 'enter your full name',
                              controller: viewModel.fullName,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Mobile Number',
                              hintText: 'enter your mobile no',
                              controller: viewModel.mobileNumber,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your mobile no';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                            ),
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
                            TextFieldItem(
                              fieldName: 'Confirmation password',
                              hintText: 'enter your Confirmation password',
                              controller: viewModel.confirmationPassword,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter rePassword';
                                }
                                if (value != viewModel.password.text) {
                                  return "password doesn't match";
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.register();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r))),
                        ),
                        child: SizedBox(
                          height: 64.h,
                          width: 398.w,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
