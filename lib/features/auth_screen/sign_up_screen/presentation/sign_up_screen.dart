import 'package:boylar_plate/common_widgets/custom_field.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  bool _isCObscure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center vertically
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Center horizontally
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Create Account",
                    style: TextFontStyle.headLine30w800Poppins,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Join us and start your journey",
                    style: TextFontStyle.textStyle16w800Poppins.copyWith(
                      color: AppColors.c6B7280,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    isPrefixIcon: true,
                    isBorder: true,
                    fillColor: AppColors.cFBFBFB,
                    hintText: 'Full Name',
                    iconpath: AppIcons.profileGrey,
                    controller: _fullNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    isPrefixIcon: true,
                    isBorder: true,
                    fillColor: AppColors.cFBFBFB,
                    hintText: 'Email',
                    iconpath: AppIcons.emailSvg,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    name: 'Sign Up',
                    onCallBack: () async {
                      await postSignUpRX.signup(
                        email: _emailController.text,
                        password: _passwordController.text,
                        password_confirmation: _passwordController.text,
                        username: _fullNameController.text,
                      );
                      NavigationService.navigateToWithArgs(
                        Routes.userOTPScreen,
                        {
                          'email': _emailController.text,
                          'action': "email_verification"
                        },
                      );
                    },
                    context: context,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.horizontal_line,
                        width: 110,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Or Continue with',
                        style: TextFontStyle.textStyle14w500Poppins,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        AppImages.horizontal_line,
                        width: 110,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.google_button,
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextFontStyle.textStyle14w500Poppins,
                      ),
                      TextButton(
                        onPressed: () {
                          NavigationService.navigateTo(Routes.signInScreen);
                        },
                        child: Text(
                          'Sign In',
                          style: TextFontStyle.textStyle14w500Poppins.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By continuing you agree to our Terms of Service \nand Privacy Policy',
                        style: TextFontStyle.textStyle14w500Poppins,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
