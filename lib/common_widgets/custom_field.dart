// ignore_for_file: library_private_types_in_public_api

import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  final int maxline;
  final bool readOnly;
  final bool isBorder;
  final Color fillColor;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 10.0, // Set to 10 pixels
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline = 1,
    this.isBorder = false,
    this.fillColor = AppColors.cFBFBFB,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        maxLines: widget.maxline,
        focusNode: _focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextFontStyle.textStyle14w400Poppins.copyWith(
            color: AppColors.c919293,
            fontSize: 14,
            height: 22 / 14,
            letterSpacing: 0.8,
          ),
          prefixIcon: widget.isPrefixIcon && widget.iconpath != null
              ? Padding(
                  padding: EdgeInsets.only(left: 20, right: 12),
                  child: SvgPicture.asset(
                    widget.iconpath!,
                    width: 24,
                    color:
                        _isFocused ? AppColors.primaryColor : AppColors.c000000,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onSuffixIconTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      widget.suffixIcon,
                      color: _isFocused
                          ? AppColors.primaryColor
                          : AppColors.c919293,
                    ),
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.isBorder == true
                ? const BorderSide(
                    color:
                        AppColors.cEBEBEB, // Adjust the border width if needed
                  )
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(
              color:
                  AppColors.primaryColor, // Adjust the border width if needed
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
}
