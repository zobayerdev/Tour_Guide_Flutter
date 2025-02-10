// ignore_for_file: unused_local_variable

import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/common_searchbar.dart';
import 'package:boylar_plate/helpers/all_routes.dart';
import 'package:boylar_plate/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, String>> _popularDestinations = [
    {'name': 'Bali, Indonesia', 'image': AppImages.pimage1, 'price': '\$499'},
    {'name': 'Paris, France', 'image': AppImages.pimage2, 'price': '\$799'},
    {'name': 'New York, USA', 'image': AppImages.pimage3, 'price': '\$899'},
    {'name': 'London, UK', 'image': AppImages.pimage4, 'price': '\$699'},
    {'name': 'Tokyo, Japan', 'image': AppImages.pimage5, 'price': '\$599'},
    {'name': 'Sydney, Australia', 'image': AppImages.pimage6, 'price': '\$899'},
  ];

  final List<Map<String, String>> locations = [
    {'name': 'Dhaka', 'image': AppImages.pimage1},
    {'name': 'New York', 'image': AppImages.pimage2},
    {'name': 'London', 'image': AppImages.pimage3},
    {'name': 'Tokyo', 'image': AppImages.pimage4},
    {'name': 'Paris', 'image': AppImages.pimage5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Explore',
                  style: TextFontStyle.headLine30w800Poppins,
                ),
                const SizedBox(height: 5),
                Text(
                  'Discover the world\'s best destinations',
                  style: TextFontStyle.textStyle18w500Poppins.copyWith(
                    color: AppColors.c444444,
                  ),
                ),
                const SizedBox(height: 20),
                // Search Bar
                CommonSearchBar(),
                const SizedBox(height: 20),

                // Popular Destinations Title
                Text(
                  'Popular Destinations',
                  style: TextFontStyle.textStyle18w800Poppins,
                ),
                const SizedBox(height: 20),

                // GridView for Destinations
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85, // Adjusts card shape
                  ),
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable inner scrolling
                  itemCount: _popularDestinations.length,
                  itemBuilder: (context, index) {
                    final destination = _popularDestinations[index];

                    return GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.detailsScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Destination Image
                                Image.asset(
                                  destination['image']!,
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Destination Name
                                      Text(
                                        destination['name']!,
                                        style: TextFontStyle
                                            .textStyle18w500Poppins,
                                      ),
                                      const SizedBox(height: 5),
                                      // Location & Price
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            destination['name']!.split(
                                                ',')[1], // Extracts country
                                            style: TextFontStyle
                                                .textStyle14w600Poppins
                                                .copyWith(
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          Text(
                                            destination['price']!,
                                            style: TextFontStyle
                                                .textStyle14w600Poppins
                                                .copyWith(
                                              color: AppColors.primaryColor,
                                            ),
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
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Trending Destinations',
                      style: TextFontStyle.textStyle18w800Poppins,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height:
                      200, // Height should accommodate the container and its content
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    itemCount: _popularDestinations
                        .length, // Number of items (adjust as needed)
                    itemBuilder: (context, index) {
                      final trending_Destination = _popularDestinations[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8), // Spacing between items
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 0.1,
                                offset: Offset(2, 2), // Shadow effect
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white, // Inner solid color
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.asset(
                                      trending_Destination['image']!,
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bali, Indonesia',
                                          style: TextFontStyle
                                              .textStyle18w500Poppins,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.locationPost,
                                              width: 16,
                                              height: 16,
                                              color: AppColors.primaryColor,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Bali, Indonesia',
                                              style: TextFontStyle
                                                  .textStyle13w400Poppins,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              trending_Destination['price']!,
                                              style: TextFontStyle
                                                  .textStyle13w800Poppins
                                                  .copyWith(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            Text(
                                              '4.8',
                                              style: TextFontStyle
                                                  .textStyle14w400Poppins,
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
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Popular',
                      style: TextFontStyle.textStyle18w800Poppins,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 130, // Enough height to fit the images and text
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: locations.map((location) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10), // Spacing between items
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  location['image']!,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                location['name']!,
                                style: TextFontStyle.textStyle16w500Poppins,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
