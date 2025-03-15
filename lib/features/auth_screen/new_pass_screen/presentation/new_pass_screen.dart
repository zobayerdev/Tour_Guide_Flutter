import 'dart:developer';
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/common_widgets/custom_appbar.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:flutter/material.dart';

class CreateNewPassScreen extends StatefulWidget {
  final String email, otp;
  const CreateNewPassScreen(
      {super.key, required this.email, required this.otp});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
  bool _isObscure = true;
  bool _isCObscure = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    log(widget.email);
    log(widget.otp);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forget Password',
        leadingIconUnVisible: false,
        onCallBack: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextFormField(
                  obscureText: _isObscure,
                  isPrefixIcon: true,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  suffixIcon:
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                  onSuffixIconTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  hintText: 'Password',
                  iconpath: AppIcons.lockSvg,
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  obscureText: _isCObscure,
                  isPrefixIcon: true,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  suffixIcon:
                      _isCObscure ? Icons.visibility_off : Icons.visibility,
                  onSuffixIconTap: () {
                    setState(() {
                      _isCObscure = !_isCObscure;
                    });
                  },
                  hintText: 'Confirm Password',
                  iconpath: AppIcons.lockSvg,
                  controller: _confirmPasswordController,
                ),
                SizedBox(
                  height: 20,
                ),
                customButton(
                  name: 'Create Password',
                  onCallBack: () async {
                    await resetPassApiRx.resetPassRX(
                      email: widget.email,
                      otp: widget.otp,
                      password: _passwordController.text,
                      password_confirmation: _confirmPasswordController.text,
                    );
                    NavigationService.navigateTo(Routes.signInScreen);
                  },
                  context: context,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
