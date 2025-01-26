// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../../common_widgets/icon_holder_widget.dart';
// import '../../../../constants/text_font_style.dart';
// import '../../../../gen/colors.gen.dart';
// import '../../../../helpers/ui_helpers.dart';

// class RowTitleNav extends StatelessWidget {
//   final String title;
//   final VoidCallback function;
//   final bool showGoToIcon;
//   const RowTitleNav({
//     required this.title,
//     required this.function,
//     super.key,
//     this.showGoToIcon = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           title,
//           style: TextFontStyle.headline20c292E34ODmSans700.copyWith(
//               color: AppColors.c0A0909,
//               fontWeight: FontWeight.w600,
//               fontSize: 19.sp),
//         ),
//         const Spacer(),
//         if (showGoToIcon)
//           InkWell(
//               onTap: function,
//               child: Row(
//                 children: [
//                   Text(
//                     // ignore: prefer_adjacent_string_concatenation
//                     "VER TODOS".tr,
//                     style: TextFontStyle.textStyle12c97A0AFpenSans400.copyWith(
//                         color: AppColors.c0A0909, fontWeight: FontWeight.w400),
//                   ),
//                   UIHelper.verticalSpaceMedium,
//                   IconHolder(
//                     icon: Icons.arrow_forward_ios,
//                     size: 10.sp,
//                     bgColor: AppColors.cFFFFFF,
//                     iconColor: AppColors.c0A0909,
//                   ),
//                 ],
//               ))
//       ],
//     );
//   }
// }
