import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_text_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  ReusableFormField(
                    hintText: 'Email',
                    hintTextColor: AppColors.c6B7280,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppIcons.emailSvg,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableFormField(
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppIcons.lockSvg,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        AppIcons.eyeSvg,
                      ),
                    ),
                    hintTextColor: AppColors.c6B7280,
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
                    onCallBack: () {
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
