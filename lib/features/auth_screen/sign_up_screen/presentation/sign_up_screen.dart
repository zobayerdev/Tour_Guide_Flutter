import 'package:flutter/material.dart';
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_text_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  ReusableFormField(
                    hintText: 'Enter Full Name',
                    hintTextColor: AppColors.c6B7280,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableFormField(
                    hintText: 'Enter your Email',
                    hintTextColor: AppColors.c6B7280,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableFormField(
                    hintText: 'Create Password',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        AppIcons.eyeSvg,
                      ),
                    ),
                    hintTextColor: AppColors.c6B7280,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton(
                    name: 'Sign Up',
                    onCallBack: () {},
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
