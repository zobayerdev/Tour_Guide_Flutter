import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRect(
                          child: Image.asset(
                            AppImages.profile,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: 15,
                          child: GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                Routes.editProfileScreen,
                              );
                            },
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
                SizedBox(
                  height: 5,
                ),
                Text(
                  'John Doe',
                  style: TextFontStyle.headLine22w800Poppins,
                ),
                Text(
                  'Travel Enthusiast',
                  style: TextFontStyle.textStyle18w500Poppins,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Personal Information',
                      style: TextFontStyle.headLine22w600Poppins,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cEAE4E1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppIcons.profileSvg,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                          Text(
                            'Md. Zobayer Hasan Nayem',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cEAE4E1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppIcons.profileSvg,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                          Text(
                            'zobayer.dev@outlook.com',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cEAE4E1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppIcons.profileSvg,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                          Text(
                            '+88 01615257555',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cEAE4E1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppIcons.profileSvg,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                          Text(
                            'Tongi, Gazipur',
                            style: TextFontStyle.textStyle16w500Poppins,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Setting & Privacy',
                      style: TextFontStyle.headLine22w600Poppins,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              AppIcons.privacySvg,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Privacy Policy',
                                style: TextFontStyle.textStyle16w500Poppins,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowNext,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(
                      Routes.notificationScreen,
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                AppIcons.notificationSvg,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Notification',
                                  style: TextFontStyle.textStyle16w500Poppins,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          AppIcons.arrowNext,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              AppIcons.language,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Language',
                                style: TextFontStyle.textStyle16w500Poppins,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowNext,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              AppIcons.help,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Help & Support',
                                style: TextFontStyle.textStyle16w500Poppins,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowNext,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              AppIcons.privacyPolicySvg,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Privacy Policy',
                                style: TextFontStyle.textStyle16w500Poppins,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppIcons.arrowNext,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToUntilReplacement(
                      Routes.signInScreen,
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                AppIcons.logoutSvg,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Log Out',
                                  style: TextFontStyle.textStyle16w500Poppins
                                      .copyWith(
                                    color: AppColors.cFF2368,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          AppIcons.arrowNext,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
