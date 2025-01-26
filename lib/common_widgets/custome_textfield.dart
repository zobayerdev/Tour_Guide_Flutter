import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

// ignore: must_be_immutable
final class CustomNumberFormField extends StatelessWidget {
  String? hintText;
  final String labelText;
  TextEditingController textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  final String? Function(String?)? validator;
  bool? validation;
  CustomNumberFormField(
      {super.key,
      this.hintText,
      required this.labelText,
      required this.textEditingController,
      required this.inputType,
      this.fieldHeight,
      this.maxline,
      this.validator,
      this.validation = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight ?? 35.h,
      child: TextFormField(
        cursorHeight: 20.0,
        autovalidateMode: validation! ? AutovalidateMode.always : AutovalidateMode.disabled,
        validator: validator,
        maxLines: maxline ?? 1,
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppColors.c9B9B9B,
          ),
          //labelText: labelText,
          labelStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal,
            color: AppColors.c9B9B9B,
          ),
          errorStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal,
            color: Colors.red,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0.r),
            borderSide: const BorderSide(
              color: AppColors.c9B9B9B,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0.r),
            borderSide: const BorderSide(
              color: AppColors.c9B9B9B,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            borderSide: const BorderSide(
              color: AppColors.c9B9B9B,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0.r),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0.r),
            borderSide: const BorderSide(
              color: AppColors.c9B9B9B,
              width: 1.5,
            ),
          ),
        ),
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: 18.sp,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.normal,
          color: AppColors.c9B9B9B,
        ),
        keyboardType: inputType,
      ),
    );
  }
}
