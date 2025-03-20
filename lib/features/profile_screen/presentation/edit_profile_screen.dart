import 'dart:io';
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/assets_helper/app_lottie.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/common_widgets/custom_field.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class EditProfileScreen extends StatefulWidget {
  final String? name;
  final String? gender;
  final String? phone;
  final String? bio;

  const EditProfileScreen({
    super.key,
    this.name,
    this.gender,
    this.phone,
    this.bio,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  File? _profileImage; // To store the selected image
  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();

  // Method to show the image picker options
  void _showImagePicker() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Pick an image',
            style: TextFontStyle.textStyle18w600Poppins.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Pick image from the camera
                XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    _profileImage =
                        File(pickedFile.path); // Set the selected image
                  });
                }
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'Camera',
                style: TextFontStyle.textStyle16w600Poppins.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Pick image from the gallery
                XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _profileImage =
                        File(pickedFile.path); // Set the selected image
                  });
                }
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'Gallery',
                style: TextFontStyle.textStyle16w600Poppins.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController bioController = TextEditingController();

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
                        ClipOval(
                          child: _profileImage == null
                              ? Image.asset(
                                  AppImages.profile,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  _profileImage!,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 5,
                          child: GestureDetector(
                            onTap:
                                _showImagePicker, // Show the image picker when clicked
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
                CustomTextFormField(
                  isPrefixIcon: false,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  hintText: 'Full Name',
                  iconpath: AppIcons.emailSvg,
                  controller: nameController..text = widget.name ?? '',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Gender',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                CustomTextFormField(
                  isPrefixIcon: false,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  hintText: 'Gender',
                  iconpath: AppIcons.emailSvg,
                  controller: genderController..text = widget.gender ?? '',
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
                CustomTextFormField(
                  isPrefixIcon: false,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  hintText: 'Phone Number',
                  iconpath: AppIcons.emailSvg,
                  controller: phoneController..text = widget.phone ?? '',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Bio',
                      style: TextFontStyle.textStyle14w500Poppins,
                    ),
                  ],
                ),
                CustomTextFormField(
                  isPrefixIcon: false,
                  isBorder: true,
                  fillColor: AppColors.cFBFBFB,
                  hintText: 'Enter your bio',
                  maxline: 5,
                  iconpath: AppIcons.emailSvg,
                  controller: bioController..text = widget.bio ?? '',
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading // If the loading state is true, show loading
                    ? Container(
                        height: 62,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Lottie.asset(
                          AppLottie.loading,
                          height: 100,
                          width: 100,
                        ),
                      )
                    : customButton(
                        name: 'Change Info',
                        onCallBack: () async {
                          setState(() {
                            isLoading = true; // Start loading
                          });

                          if (_profileImage != null) {
                            await postUpdateProfileImageRx.updateImageRx(
                              avatar: _profileImage,
                            );
                          } else {
                            await postUpdateProfileRx.updateProfileRx(
                              name: nameController.text,
                              phone: phoneController.text,
                              gender: genderController.text,
                              bio: bioController.text,
                            );
                          }
                          await postUpdateProfileRx.updateProfileRx(
                            name: nameController.text,
                            phone: phoneController.text,
                            gender: genderController.text,
                            bio: bioController.text,
                          );

                          setState(() {
                            isLoading = false; // Stop loading
                          });

                          NavigationService.navigateTo(Routes.navigationScreen);
                        },
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
