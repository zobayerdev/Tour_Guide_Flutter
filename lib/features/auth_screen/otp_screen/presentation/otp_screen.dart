import 'dart:developer';

import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:boylar_plate/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UserOTPScreen extends StatefulWidget {
  final String email, action;
  const UserOTPScreen({
    super.key,
    required this.email,
    required this.action,
  });

  @override
  State<UserOTPScreen> createState() => _UserOTPScreenState();
}

class _UserOTPScreenState extends State<UserOTPScreen> {
  @override
  void initState() {
    super.initState();
    log(widget.email);
    log(widget.action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    AppImages.verification_image,
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Verification Code',
                    style: TextFontStyle.headLine24w600Poppins,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'We\'ve sent a verification code to',
                    style: TextFontStyle.textStyle14w500Poppins,
                  ),
                  Text(
                    widget.email,
                    style: TextFontStyle.textStyle14w700Poppins,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 65,
                      fieldWidth: 70,
                      inactiveFillColor: AppColors.whiteColor.withOpacity(0.1),
                      borderWidth: 2,
                      errorBorderColor: AppColors.whiteColor,
                      inactiveColor: AppColors.blackColor.withOpacity(0.1),
                      selectedColor: AppColors.whiteColor.withOpacity(0.1),
                      selectedBorderWidth: 2,
                      activeBorderWidth: 2,
                      activeFillColor: AppColors.whiteColor,
                      activeColor: AppColors.whiteColor,
                      selectedFillColor: AppColors.cEAE4E1,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    //controller: otpController,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    appContext: context,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Resend Code in 00:30',
                    style: TextFontStyle.textStyle14w500Poppins,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(
                    name: 'Verify',
                    onCallBack: () {
                      NavigationService.navigateTo(Routes.signInScreen);
                    },
                    context: context,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive the code?',
                        style: TextFontStyle.textStyle14w500Poppins,
                      ),
                      GestureDetector(
                        onTap: () {
                          ToastUtil.showShortToast('Code Send Successfully');
                        },
                        child: Text(
                          ' Resend',
                          style: TextFontStyle.textStyle14w600Poppins.copyWith(
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
