// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/text_font_style.dart';
// import '../gen/colors.gen.dart';

// class CustomTextfield extends StatelessWidget {
//   const CustomTextfield(
//       {super.key,
//       this.hintText,
//       this.validation,
//       this.obscuretext,
//       this.onchanged,
//       this.controller,
//       this.suffixIcon,
//       this.suffixIconOntap,
//       this.fillColor,
//       this.maxLines,
//       this.borderRadius,
//       this.keyboardType,
//       this.isPrefix = true,
//       this.isSuffix = true,
//       this.contentVerticalPadding,
//       //this.fillColors,
//       this.borderColor,
//       this.prefixIcon,
//       this.prefixIconOntap,
//       this.readOnly,
//       this.ontap,
//       this.fontSize,
//       this.onSubmitted,
//       this.hintColor});

//   final hintText;
//   final validation;
//   final obscuretext;
//   final onchanged;
//   final controller;
//   final suffixIcon;
//   final prefixIcon;
//   final suffixIconOntap;
//   final prefixIconOntap;
//   final fillColor;
//   final maxLines;
//   final double? borderRadius;
//   final keyboardType;
//   final bool isPrefix;
//   final bool isSuffix;
//   final double? contentVerticalPadding;

//   final Color? borderColor;
//   final readOnly;
//   final ontap;
//   final double? fontSize;
//   final onSubmitted;
//   final hintColor;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: onchanged,
//       validator: validation,
//       controller: controller,
//       onTap: ontap,
//       obscureText: obscuretext ?? false,
//       keyboardType: keyboardType,
//       maxLines: maxLines ?? 1,
//       readOnly: readOnly ?? false,
//       onFieldSubmitted: onSubmitted,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextFontStyle.textStyle16w400cA1A1A1StylePoppins.copyWith(
//           color: hintColor ?? AppColors.cE8E8E8,
//           fontSize: fontSize ?? 16.sp,
//         ),

//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 10.w,
//           vertical: contentVerticalPadding ?? 15.h,
//         ),
//         suffixIcon: isSuffix == true ? suffixIcon : SizedBox(),
//         prefixIcon: isPrefix == true ? prefixIcon : SizedBox(),
//         filled: true,

//         fillColor: fillColor ?? fillColor,

//         //enable-->
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
//           borderSide: BorderSide(
//             color: borderColor ?? AppColors.cE8ECEC,
//             width: 1.w,
//           ),
//         ),
//         //focus-->
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: AppColors.cFFFFFF,
//             width: 1.5.w,
//           ),
//           borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
//         ),
//         //focus-->
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: AppColors.cFFFFFF,
//             width: 2.w,
//           ),
//           borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.hintText,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.controller,
      this.suffixIcon,
      this.suffixIconOntap,
      this.fillColor,
      this.maxLines,
      this.borderRadius,
      this.keyboardType,
      this.isPrefix = true,
      this.isSuffix = true,
      this.contentVerticalPadding,
      this.borderColor,
      this.prefixIcon,
      this.prefixIconOntap,
      this.readOnly,
      this.ontap,
      this.fontSize,
      this.onSubmitted,
      this.hintColor});

  final hintText;
  final validation;
  final obscuretext;
  final onchanged;
  final controller;
  final suffixIcon;
  final prefixIcon;
  final suffixIconOntap;
  final prefixIconOntap;
  final fillColor;
  final maxLines;
  final double? borderRadius;
  final keyboardType;
  final bool isPrefix;
  final bool isSuffix;
  final double? contentVerticalPadding;
  final Color? borderColor;
  final readOnly;
  final ontap;
  final double? fontSize;
  final onSubmitted;
  final hintColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Subtle shadow color
            blurRadius: 10, // Spread of the blur
            offset: Offset(0, 4), // Offset in X and Y direction
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
      ),
      child: TextFormField(
        onChanged: onchanged,
        validator: validation,
        controller: controller,
        onTap: ontap,
        obscureText: obscuretext ?? false,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextFontStyle.textStyle16w400cA1A1A1StylePoppins.copyWith(
            color: hintColor ?? AppColors.cE8E8E8,
            fontSize: fontSize ?? 16.sp,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: contentVerticalPadding ?? 15.h,
          ),
          suffixIcon: isSuffix == true ? suffixIcon : SizedBox(),
          prefixIcon: isPrefix == true ? prefixIcon : SizedBox(),
          filled: true,
          fillColor: fillColor ?? fillColor,
          // Enable -->
          enabledBorder: InputBorder.none, // No border when not focused
          // Focus -->
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.cFFFFFF,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          ),
          // Error -->
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.cFFFFFF,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          ),
        ),
      ),
    );
  }
}
