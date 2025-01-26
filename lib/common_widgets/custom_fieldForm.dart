import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class ReusableFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? minLine;
  final int? maxLine;
  const ReusableFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.minLine,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextFontStyle.textStyle14w400c333333StylePoppins
              .copyWith(color: AppColors.cA8A8A8),
        ),
        UIHelper.verticalSpace(12.h),
        TextField(
          minLines: minLine ?? 1,
          maxLines: null,
          decoration: InputDecoration(
            fillColor: AppColors.cFFFFFF,
            filled: true,
            hintText: hintText,
            hintStyle: TextFontStyle.textStyle14w400c333333StylePoppins
                .copyWith(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.cE8E8E8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.cE8E8E8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.cE8E8E8),
            ),
          ),
        ),
        UIHelper.verticalSpace(12.h),
      ],
    );
  }
}
