// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../../gen/colors.gen.dart';
// import '../helpers/di.dart';
// import '../helpers/helper_methods.dart';
// import '../constants/app_constants.dart';
// import '../constants/text_font_style.dart';

// final class PopupWidget extends StatefulWidget {
//   const PopupWidget({super.key, required this.language});
//   final TextEditingController language;

//   @override
//   State<PopupWidget> createState() => _PopupWidgetState();
// }

// class _PopupWidgetState extends State<PopupWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         popUpGlobalkey.currentState!.showButtonMenu();
//       },
//       child: Container(
//         color: AppColors.cF4F4F4,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(language(appData.read(kKeyLanguage)),
//                 style: TextFontStyle.textStyle14c292E34DmSans700
//                     .copyWith(color: AppColors.c000000)),
//             const Spacer(),
//             PopupMenuButton<String>(
//               key: popUpGlobalkey,
//               icon: Icon(
//                 Icons.keyboard_arrow_down_rounded,
//                 color: Colors.black,
//                 size: 20.sp,
//               ),
//               iconSize: (ScreenUtil().screenWidth > 600) ? 25.r : 14.r,
//               onSelected: (String value) {
//                 setState(() {
//                   appData.write(kKeyLanguage, value);
//                   appData.write(kKeyLanguageCode, value);
//                   appData.write(kKeyCountryCode, countriesCode[value]);
//                 });
//                 var locale = Locale(value, countriesCode[value]);
//                 // DioSingleton.instance.updateLanguage(value);
//                 Get.updateLocale(locale);
//               },
//               color: Colors.white,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(6),
//                 ),
//               ),
//               offset: const Offset(-100, kToolbarHeight),
//               itemBuilder: (context) {
//                 return kLanguagesKey
//                     .map((String value) => PopupMenuItem<String>(
//                           value: value,
//                           child: Text(languages[value]),
//                         ))
//                     .toList();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
