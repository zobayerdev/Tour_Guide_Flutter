import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_appbar.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_text_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  AppImages.lock,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Forget Password",
                  style: TextFontStyle.headLine24w700Poppins.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter email address",
                      style: TextFontStyle.textStyle14w700Poppins,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ReusableFormField(
                  hintText: 'Enter your email',
                  hintTextColor: AppColors.c6B7280,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppIcons.emailSvg,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                customButton(
                  name: 'Send reset link',
                  onCallBack: () {
                    NavigationService.navigateTo(Routes.userOTPScreen);
                  },
                  context: context,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Didn't receive the email? Check your spam folder or",
                      style: TextFontStyle.textStyle14w400Poppins,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "try another email address",
                      style: TextFontStyle.textStyle14w400Poppins.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember your password?",
                      style: TextFontStyle.textStyle12w500Poppins,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Sign In",
                        style: TextFontStyle.textStyle12w800Poppins.copyWith(
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
    );
  }
}
