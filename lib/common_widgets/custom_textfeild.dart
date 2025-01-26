import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  final controller;
  final IconData? suffixIcon;
  bool isSufixIcon;
  bool isenabled;
  Color? textColor;
  bool isObsecure;

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.textColor = AppColors.c919293,
    this.isSufixIcon = false,
    this.isenabled = true,
    this.isObsecure = false,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cFFFFFF,
        labelStyle: TextFontStyle.textStyle16w400cA1A1A1StylePoppins,
        suffixIcon: widget.isSufixIcon == true
            ? const Icon(
                Icons.search,
                color: AppColors.cCFCFCF,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
        hintText: widget.hintText,
        hintStyle: TextFontStyle.textStyle14c334155Poppins400
            .copyWith(color: AppColors.c5A5C5F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
      ),
    );
  }
}
