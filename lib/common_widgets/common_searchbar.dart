import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    super.key,
    this.controller,
    this.onSubmitted,
    this.hintText,
  });

  final TextEditingController? controller;
  final onSubmitted;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        hintText: hintText,
        hintStyle: TextFontStyle.textStyle12cC2C2C2Popinsw400.copyWith(
          color: AppColors.c5A5C5F,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Image.asset(
              height: 14.h,
              width: 14.w,
              fit: BoxFit.cover,
              Assets.images.searchsNew.path),
        ),

        border: OutlineInputBorder(),
        // enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.allPrimaryColor),
        ),
      ),
    );
  }
}
