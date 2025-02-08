import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:flutter/material.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        hintText: hintText,
        hintStyle: TextFontStyle.textStyle12w400Poppins.copyWith(
          color: AppColors.c5A5C5F,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.0),
          child: Image.asset(
            height: 14,
            width: 14,
            fit: BoxFit.cover,
            AppImages.searchImage,
          ),
        ),

        suffixIcon: Padding(
          padding: EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            height: 14,
            width: 14,
            fit: BoxFit.cover,
            AppIcons.filterSvg,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // Removes default border
        ),
        filled: true, // Enables background color
        fillColor: Colors.grey.withOpacity(0.1),
        //border: OutlineInputBorder(),
        // enabledBorder: OutlineInputBorder(),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: AppColors.primaryColor,
        //   ),
        // ),
      ),
    );
  }
}
