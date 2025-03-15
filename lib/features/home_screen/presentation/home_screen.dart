// ignore_for_file: camel_case_types

import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_images.dart';
import 'package:boylar_plate/common_widgets/common_searchbar.dart';
import 'package:boylar_plate/common_widgets/custom_button.dart';
import 'package:boylar_plate/features/home_screen/model/category_model/category_model.dart';
import 'package:boylar_plate/features/home_screen/widgets/destination_card.dart';
import 'package:boylar_plate/networks/api_acess.dart';
import 'package:boylar_plate/networks/endpoints.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getCategoryAPIRX.getCategoryRX();
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
                      'TravelGuide',
                      style: TextFontStyle.headLine30w800Poppins,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonSearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Image.asset(AppImages.main),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discover Amazing Places',
                                style: TextFontStyle.headLine24w800Poppins
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              customButton(
                                name: 'Explore',
                                onCallBack: () {},
                                context: context,
                                minWidth: 210,
                                height: 55,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    StreamBuilder<CategoryModel>(
                      stream: getCategoryAPIRX.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          CategoryModel categoryModel = snapshot.data!;
                          var data = categoryModel.data;
                          return SizedBox(
                            height:
                                100, // Set the height of the row for better visual appearance
                            child: ListView.builder(
                              itemCount: data!.length,
                              scrollDirection: Axis
                                  .horizontal, // Set scrollDirection to horizontal
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0), // Space between items
                                  child: categoryWidgets(
                                    title: data[index].title!,
                                    image: imageUrls + data[index].image!,
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
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
                      height: 375, // Adjust height as needed
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1, // Square items
                        ),
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling to fit within the page scroll
                        itemCount: 4, // 4 items
                        itemBuilder: (context, index) {
                          return Container(
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
                                        AppImages.image1,
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
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '\$499',
                                            style: TextFontStyle
                                                .textStyle14w600Poppins
                                                .copyWith(
                                              color: AppColors.primaryColor,
                                            ),
                                          )
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

class categoryWidgets extends StatelessWidget {
  final String title;
  final String image;

  const categoryWidgets({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextFontStyle.textStyle14w400Poppins,
        ),
      ],
    );
  }
}
