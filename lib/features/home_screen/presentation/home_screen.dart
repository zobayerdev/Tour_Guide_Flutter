import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'TravelGuide',
                  style: TextFontStyle.headLine22w800Poppins,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover the best of the world',
                      style: TextFontStyle.textStyle18w400Poppins,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customButton(
                      name: 'Explore',
                      onCallBack: () {},
                      context: context,
                      minWidth: 200,
                      height: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Categories',
                      style: TextFontStyle.textStyle18w800Poppins,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              AppImages.adventure,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Adventure',
                              style: TextFontStyle.textStyle14w400Poppins,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AppImages.culture,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Culture',
                              style: TextFontStyle.textStyle14w400Poppins,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              AppImages.nature,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Nature',
                              style: TextFontStyle.textStyle14w400Poppins,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(AppIcons.food),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Food',
                              style: TextFontStyle.textStyle14w400Poppins,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Popular Destinations',
                      style: TextFontStyle.textStyle18w800Poppins,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height:
                          200, // Height should accommodate the container and its content
                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal, // Horizontal scrolling
                        itemCount: 5, // Number of items (adjust as needed)
                        itemBuilder: (context, index) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Image.asset(
                                          AppImages.image1,
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Bali, Indonesia',
                                          style: TextFontStyle
                                              .textStyle18w500Poppins,
                                          textAlign: TextAlign.start,
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Features Destinations',
                      style: TextFontStyle.textStyle18w800Poppins,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   height: 100,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Colors.white,
                    //       border: Border.all(
                    //           width: 2,
                    //           color: AppColors.c02BF65) // Inner solid color
                    //       ),
                    //   child: Row(
                    //     children: [
                    //       Image.asset(AppImages.fimg1),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             'Bali, Indonesia',
                    //             style: TextFontStyle.textStyle18w500Poppins,
                    //           ),
                    //           Row(
                    //             children: [
                    //               SvgPicture.asset(
                    //                 AppIcons.locationPost,
                    //                 color: AppColors.primaryColor,
                    //               ),
                    //               Text(
                    //                 'Lalbagh, Dhaka',
                    //                 style: TextFontStyle.textStyle14w400Poppins,
                    //               ),
                    //             ],
                    //           ),
                    //           Row(
                    //             children: [
                    //               Text(
                    //                 'Approximate Price: ',
                    //                 style: TextFontStyle.textStyle14w400Poppins,
                    //               ),
                    //               Text(
                    //                 '\$1000',
                    //                 style: TextFontStyle.textStyle14w600Poppins
                    //                     .copyWith(
                    //                   color: AppColors.primaryColor,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    DestinationCard(
                      address: 'Ahsan Monzil',
                      location: 'Lalbagh, Dhaka',
                      price: '\$1000',
                      image: AppImages.fimg1,
                    ),
                    DestinationCard(
                      address: 'Ahsan Monzil',
                      location: 'Lalbagh, Dhaka',
                      price: '\$1000',
                      image: AppImages.fimg1,
                    ),
                    DestinationCard(
                      address: 'Ahsan Monzil',
                      location: 'Lalbagh, Dhaka',
                      price: '\$1000',
                      image: AppImages.fimg1,
                    ),
                    DestinationCard(
                      address: 'Ahsan Monzil',
                      location: 'Lalbagh, Dhaka',
                      price: '\$1000',
                      image: AppImages.fimg1,
                    ),
                    DestinationCard(
                      address: 'Ahsan Monzil',
                      location: 'Lalbagh, Dhaka',
                      price: '\$1000',
                      image: AppImages.fimg1,
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

class DestinationCard extends StatelessWidget {
  final String? address;
  final String? location;
  final String? price;
  final String? image;

  const DestinationCard({
    super.key,
    this.address,
    this.location,
    this.price,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            image != null
                ? Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey,
                  ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address ?? 'Not Defined',
                  style: TextFontStyle.textStyle18w500Poppins,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.locationPost,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      location ?? 'Not Defined',
                      style: TextFontStyle.textStyle14w400Poppins,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Approximate Price: ',
                      style: TextFontStyle.textStyle14w400Poppins,
                    ),
                    Text(
                      price ?? 'Not Defined',
                      style: TextFontStyle.textStyle14w600Poppins.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
