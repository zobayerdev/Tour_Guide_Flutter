import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Place Details',
        isCenterd: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppImages.shareImg, height: 20, width: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.savedGrey),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.placeImg),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Santorini Blue Domes',
                          style: TextFontStyle.headLine22w800Poppins,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.locationPost),
                        Text(
                          'Oia, Santorini, Greece',
                          style: TextFontStyle.textStyle13w400Poppins,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBarIndicator(
                          rating: 4.5, // Set rating value
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.5',
                          style: TextFontStyle.textStyle13w400Poppins,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(2.1k reviews)',
                          style: TextFontStyle.textStyle13w400Poppins,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Entry Fee',
                                  style: TextFontStyle.textStyle14w600Poppins,
                                ),
                                Text(
                                  '\$20',
                                  style: TextFontStyle.textStyle17w600Poppins
                                      .copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                Text(
                                  'per person',
                                  style: TextFontStyle.textStyle12w400Poppins
                                      .copyWith(
                                    color: AppColors.c444444,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Best Time',
                                  style: TextFontStyle.textStyle14w600Poppins,
                                ),
                                Text(
                                  'Opening Time: 9:00 AM',
                                  style: TextFontStyle.textStyle12w700Poppins
                                      .copyWith(
                                    color: AppColors.c444444,
                                  ),
                                ),
                                Text(
                                  'Closing Time: 6:00 PM',
                                  style: TextFontStyle.textStyle12w700Poppins
                                      .copyWith(
                                    color: AppColors.c444444,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'About',
                      style: TextFontStyle.textStyle15w600Poppins,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The iconic blue domes of Santorini are one of the most photographed locations in Greece. These stunning architectural features are characteristic of Cycladic architecture and offer',
                      style: TextFontStyle.textStyle13w500Poppins,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Location',
                      style: TextFontStyle.textStyle15w600Poppins,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15), // Set border radius
                      child: Image.asset(
                        AppImages.mapImg,
                        width: double.infinity, // Adjust width as needed
                        height: 200, // Adjust height as needed
                        fit: BoxFit.cover, // Ensures the image fits well
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.busImg,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location',
                                style: TextFontStyle.textStyle15w600Poppins),
                            Text('20 KM Away from city',
                                style: TextFontStyle.textStyle12w400Poppins),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
