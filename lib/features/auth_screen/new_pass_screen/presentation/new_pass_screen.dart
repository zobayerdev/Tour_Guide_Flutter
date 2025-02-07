import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/common_widgets/custom_appbar.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateNewPassScreen extends StatefulWidget {
  const CreateNewPassScreen({super.key});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
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
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ReusableFormField(
                  hintText: 'New Password',
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
                ReusableFormField(
                  hintText: 'Confirm new password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.eyeSvg,
                    ),
                  ),
                  hintTextColor: AppColors.c6B7280,
                ),
                SizedBox(
                  height: 20,
                ),
                customButton(
                  name: 'Create Password',
                  onCallBack: () {},
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
