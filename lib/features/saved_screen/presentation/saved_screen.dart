import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List<Map<String, String>> _popularDestinations = [
    {'name': 'Bali, Indonesia', 'image': AppImages.pimage1, 'price': '\$499'},
    {'name': 'Paris, France', 'image': AppImages.pimage2, 'price': '\$799'},
    {'name': 'New York, USA', 'image': AppImages.pimage3, 'price': '\$899'},
    {'name': 'London, UK', 'image': AppImages.pimage4, 'price': '\$699'},
    {'name': 'Tokyo, Japan', 'image': AppImages.pimage5, 'price': '\$599'},
    {'name': 'Sydney, Australia', 'image': AppImages.pimage6, 'price': '\$899'},
  ];

  final Set<int> _favoriteIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Saved Place',
                      style: TextFontStyle.headLine24w600Poppins.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                        final isFavorite = _favoriteIndexes.contains(index);

                        return Container(
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
                                  // Image with Love Icon Overlay
                                  Stack(
                                    children: [
                                      Image.asset(
                                        destination['image']!,
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isFavorite) {
                                                _favoriteIndexes
                                                    .remove(index); // Unselect
                                              } else {
                                                _favoriteIndexes
                                                    .add(index); // Select
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white.withOpacity(
                                                  0.8), // Background
                                            ),
                                            child: Icon(
                                              isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFavorite
                                                  ? AppColors.primaryColor
                                                  : Colors.grey,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                        );
                      },
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
