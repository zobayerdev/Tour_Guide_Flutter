// ignore_for_file: deprecated_member_use

import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
