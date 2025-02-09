import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextFontStyle.textStyle14w500Poppins,
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: TextFontStyle.textStyle16w500Poppins
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
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
                    Stack(
                      children: [
                        ClipRect(
                          child: Image.asset(
                            AppImages.profile,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.settingSvg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Name',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                ReusableFormField(
                  hintText: 'Md. Zobayer Hasan Nayem',
                  fieldColor: AppColors.c000000.withOpacity(0.02),
                  hintTextColor: AppColors.c000000,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Username',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                ReusableFormField(
                  hintText: 'Zobayer',
                  fieldColor: AppColors.c000000.withOpacity(0.02),
                  hintTextColor: AppColors.c000000,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Phone',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                ReusableFormField(
                  hintText: '+88 01615257555',
                  fieldColor: AppColors.c000000.withOpacity(0.02),
                  hintTextColor: AppColors.c000000,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Email',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                ReusableFormField(
                  hintText: 'zobayer.dev@gmail.com',
                  fieldColor: AppColors.c000000.withOpacity(0.02),
                  hintTextColor: AppColors.c000000,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
