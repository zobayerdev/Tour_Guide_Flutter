import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:flutter/material.dart';

class ReusableFormField extends StatelessWidget {
  final String hintText;
  final int? minLine;
  final int? maxLine;
  final Widget? prefixIcon; // For prefix icon
  final Widget? suffixIcon; // For suffix icon
  final Color? borderColor; // For border color
  final double? borderWidth; // For border width
  final Color? hintTextColor;
  final Color? fieldColor; // For hint text color
  final double? iconSize;

  const ReusableFormField({
    super.key,
    required this.hintText,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.borderWidth,
    this.hintTextColor,
    this.iconSize,
    this.fieldColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          minLines: minLine ?? 1,
          maxLines: null,
          decoration: InputDecoration(
            fillColor: fieldColor ?? AppColors.cFFFFFF,
            filled: true,
            hintText: hintText,
          
            
            hintStyle: TextFontStyle.textStyle14w400Poppins
                .copyWith(color: hintTextColor ?? Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.cE8E8E8,
                width: borderWidth ?? 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.cE8E8E8,
                width: borderWidth ?? 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.cE8E8E8,
                width: borderWidth ?? 1.0,
              ),
            ),
            prefixIcon: prefixIcon != null
                ? IconTheme(
                    data: IconThemeData(
                      size: iconSize ?? 24.0, // Default size if not provided
                    ),
                    child: prefixIcon!,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? IconTheme(
                    data: IconThemeData(
                      size: iconSize ?? 24.0, // Default size if not provided
                    ),
                    child: suffixIcon!,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
