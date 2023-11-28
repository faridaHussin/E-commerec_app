import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  final FormFieldValidator<String>? validator;
  TextEditingController? controller;
  String hintText;
  bool isObscure;
  final Widget? suffixIcon;
  TextInputType? keyboardType;

  TextFieldItem({
    required this.fieldName,
    this.validator,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: theme.textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                hintText: hintText,
                hintStyle: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
                suffixIcon: suffixIcon),
            style: const TextStyle(color: Colors.black),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
