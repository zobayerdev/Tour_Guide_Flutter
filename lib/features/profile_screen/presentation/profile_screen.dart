import 'dart:developer';
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_lottie.dart';
import 'package:boylar_plate/features/profile_screen/model/profile_image_model.dart';
import 'package:boylar_plate/features/profile_screen/model/profile_model.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:boylar_plate/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getProfileImageApiRx.getImageRx();
    getProfileApiRx.getUserProfileInformation();
  }

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: TextFontStyle.headLine30w800Poppins,
                    ),
                  ],
                ),
                StreamBuilder<ProfileModel>(
                    stream: getProfileApiRx.dataFetcher,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Lottie.asset(
                          AppLottie.loading,
                          height: 100,
                          width: 100,
                        );
                      } else if (!snapshot.hasData) {
                        return Lottie.asset(
                          AppLottie.loading,
                          height: 100,
                          width: 100,
                        );
                      } else {
                        ProfileModel? profileModel = snapshot.data;
                        var info = profileModel?.data;
                        if (info == null) {
                          return Lottie.asset(
                            AppLottie.loading,
                            height: 100,
                            width: 100,
                          );
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    StreamBuilder<ProfileImageModel>(
                                        stream:
                                            getProfileImageApiRx.dataFetcher,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Lottie.asset(
                                              AppLottie.loading,
                                              height: 100,
                                              width: 100,
                                            );
                                          }
                                          if (snapshot.hasData) {
                                            ProfileImageModel?
                                                profileImageModel =
                                                snapshot.data;
                                            log("Avatar URL: ${profileImageModel?.avatar}");

                                            return ClipOval(
                                              child: Image.network(
                                                (profileImageModel?.avatar
                                                            ?.isNotEmpty ??
                                                        false)
                                                    ? imageUrls +
                                                        (profileImageModel
                                                                ?.avatar ??
                                                            '')
                                                    : '', // Default image path can be empty here
                                                width: 120,
                                                height: 120,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return Lottie.asset(
                                                      AppLottie.loading,
                                                      height: 100,
                                                      width: 100,
                                                    ); // Show Lottie animation while the image is loading
                                                  }
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Lottie.asset(
                                                    AppLottie.profileLottie,
                                                    height: 100,
                                                    width: 100,
                                                  ); // Show Lottie animation in case of error
                                                },
                                              ),
                                            );
                                          } else {
                                            return Lottie.asset(
                                              AppLottie.loading,
                                              height: 100,
                                              width: 100,
                                            ); // Show Lottie animation if no data
                                          }
                                        }),
                                    Positioned(
                                      bottom: 15,
                                      right: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          NavigationService.navigateTo(
                                              Routes.editProfileScreen);
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
                              info.name ?? 'N/A',
                              style: TextFontStyle.headLine22w700Poppins,
                            ),
                            Text(
                              info.bio ?? 'N/A',
                              style: TextFontStyle.textStyle16w500Poppins,
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
                            StreamBuilder<ProfileModel>(
                              stream: getProfileApiRx.dataFetcher,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  ProfileModel? profileModel = snapshot.data;
                                  var info = profileModel?.data;

                                  return Column(
                                    children: [
                                      _buildInfoContainer(
                                          'Full Name', info?.name ?? 'N/A'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _buildInfoContainer(
                                          'Email', info?.email ?? ''),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _buildInfoContainer(
                                          'Mobile', info?.phone ?? 'N/A'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _buildInfoContainer(
                                          'Gender', info?.gender ?? 'N/A'),
                                    ],
                                  );
                                } else {
                                  return Lottie.asset(
                                    AppLottie.loading,
                                    height: 100,
                                    width: 100,
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      }
                    }),
                Column(
                  children: [
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
                    _buildSettingsRow('Privacy Policy', AppIcons.privacySvg),
                    _buildSettingsRow('Notification', AppIcons.notificationSvg),
                    _buildSettingsRow('Language', AppIcons.language),
                    _buildSettingsRow('Help & Support', AppIcons.help),
                    _buildSettingsRow(
                        'Privacy Policy', AppIcons.privacyPolicySvg),
                    GestureDetector(
                      onTap: () async {
                        try {
                          //log(kEmail.toString());
                          log("=====================================================");
                          log("==============> Log out Successfull <================");
                          log("=====================================================");
                          await postLogOutRX.logOut().then(
                            (v) {
                              if (v) {
                                NavigationService.navigateToUntilReplacement(
                                  Routes.signInScreen,
                                );
                              }
                            },
                          );
                        } catch (error) {
                          log(error.toString());
                        }
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
                                      style: TextFontStyle
                                          .textStyle16w500Poppins
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a personal info container
  Widget _buildInfoContainer(String title, String value) {
    return Container(
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
                title,
                style: TextFontStyle.textStyle16w500Poppins,
              ),
              Text(
                value,
                style: TextFontStyle.textStyle16w500Poppins,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build a settings row
  Widget _buildSettingsRow(String title, String icon) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
    );
  }
}
