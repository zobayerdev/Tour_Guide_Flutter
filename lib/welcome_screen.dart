import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allPrimaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        //decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.h,
            ),
            Image.asset(
              Assets.images.appLogo.path,
              height: 170.h,
              width: 170.w,
            ),
          ],
        ),
      ),
    );
  }
}
