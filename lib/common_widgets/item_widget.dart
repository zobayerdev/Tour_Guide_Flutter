// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../helpers/animation_helper.dart';
// import '../../../../gen/colors.gen.dart';
// import '../constants/text_font_style.dart';

// final class ItemWidget extends StatelessWidget {
//   final Map item;

//   const ItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {},
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//         height: .3.sh,
//         width: .4.sw,
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(5)),
//               child: CachedNetworkImage(
//                 imageUrl: item['image_full_path'],
//                 height: .3.sh,
//                 width: .4.sw,
//                 fit: BoxFit.fitHeight,
//                 placeholder: (context, url) => imageSimmerCached(.3.sh),
//                 errorWidget: (context, url, error) => imageNotFound(.3.sh),
//               ),
//             ),
//             Positioned(
//               top: 8,
//               left: 10,
//               child: Container(
//                 width: .12.sw,
//                 height: .03.sh,
//                 decoration: BoxDecoration(
//                   color: AppColors.cEDBB43,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Center(
//                     child: Text(
//                   '3.5',
//                   style: TextFontStyle.headline7StyleMontserrat,
//                 )),
//               ),
//             ),
//             Positioned(
//                 bottom: 0,
//                 left: .025.sw,
//                 child: Container(
//                   height: .10.sh,
//                   width: .35.sw,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.white.withAlpha(100),
//                           blurRadius: 10.0,
//                           spreadRadius: 0.0,
//                         ),
//                       ],
//                       border: Border.all(color: Colors.white10.withAlpha(80)),
//                       color: Colors.black.withOpacity(0.25),
//                       borderRadius:
//                           const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(.12.sw, .03.sh, 0, 0),
//                     child: Text(
//                       item['name'],
//                       style: TextFontStyle.headline10StyleMontserrat.copyWith(color: AppColors.c2C303E),
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
