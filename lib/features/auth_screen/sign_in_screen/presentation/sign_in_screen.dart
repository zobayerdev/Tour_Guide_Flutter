import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    CrossAxisAlignment.center, // Center horizontally
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "Welcome",
                    style: TextFontStyle.headLine30w600Poppins,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextFontStyle.textStyle14w500Poppins,
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.forgotPassScreen);
                        },
                        child: Text(
                          "Forget Password",
                          style: TextFontStyle.textStyle14w500Poppins.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    name: 'Sign In',
                    onCallBack: () async {
                      await postLoginRx.signIn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      NavigationService.navigateTo(Routes.navigationScreen);
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
                  Image.asset(
                    AppImages.google_button,
                    height: 100,
                    width: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextFontStyle.textStyle14w500Poppins,
                      ),
                      TextButton(
                        onPressed: () {
                          NavigationService.navigateTo(Routes.signUpScreen);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextFontStyle.textStyle14w500Poppins.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
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
