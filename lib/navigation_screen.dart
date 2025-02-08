// ignore_for_file: unused_field
import 'package:boylar_plate/assets_helper/app_colors.dart';
import 'package:boylar_plate/assets_helper/app_fonts.dart';
import 'package:boylar_plate/assets_helper/app_icons.dart';
import 'package:boylar_plate/features/exprole_screen/presentation/explore_screen.dart';
import 'package:boylar_plate/features/home_screen/presentation/home_screen.dart';
import 'package:boylar_plate/features/profile_screen/presentation/profile_screen.dart';
import 'package:boylar_plate/features/saved_screen/presentation/saved_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({
    super.key,
    this.pageNum,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  int _colorIndex = 0;

  final bool _isFisrtBuild = true;
  bool _navigationOn = true;

  final List<StatefulWidget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen(),
    SavedScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 5;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        //showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        onDrawerChanged: (isOpened) => setState(() {
          _navigationOn = !isOpened;
        }),
        body: Center(
            child: (screenPage != null)
                ? screenPage
                : _screens.elementAt(_currentIndex)),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 24,
          selectedColor: Colors.red,
          strokeColor: AppColors.primaryColor,
          unSelectedColor: Colors.black,
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.homeBlue,
                color: (_currentIndex == 0)
                    ? AppColors.primaryColor
                    : AppColors.cA0A0A0,
              ),
              title: Text(
                "${"Home"} ",
                style: TextFontStyle.textStyle14w400Poppins.copyWith(
                  color: (_currentIndex == 0)
                      ? AppColors.primaryColor
                      : AppColors.cA0A0A0,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.exploreGrey,
                color: (_currentIndex == 1)
                    ? AppColors.primaryColor
                    : AppColors.cA0A0A0,
              ),
              title: Text(
                "Explore",
                style: TextFontStyle.textStyle12w400Poppins.copyWith(
                  color: (_currentIndex == 1)
                      ? AppColors.primaryColor
                      : AppColors.cA0A0A0,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.savedGrey,
                color: (_currentIndex == 2)
                    ? AppColors.primaryColor
                    : AppColors.cA0A0A0,
              ),
              title: Text(
                "Saved",
                style: TextFontStyle.textStyle12w400Poppins.copyWith(
                  color: (_currentIndex == 2)
                      ? AppColors.primaryColor
                      : AppColors.cA0A0A0,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profileGrey,
                color: (_currentIndex == 3)
                    ? AppColors.primaryColor
                    : AppColors.cA0A0A0,
              ),
              title: Text(
                "Profile",
                style: TextFontStyle.textStyle12w400Poppins.copyWith(
                  color: (_currentIndex == 3)
                      ? AppColors.primaryColor
                      : AppColors.cA0A0A0,
                ),
              ),
            ),
            // CustomNavigationBarItem(
            //   icon: Image.asset(
            //     Assets.icons.profileIcon.path,
            //     color: (_currentIndex == 4)
            //         ? AppColors.allPrimaryColor
            //         : AppColors.cA0A0A0,
            //   ),
            //   title: Text(
            //     "Profile",
            //     style: TextFontStyle.textStyle12cC2C2C2Popinsw400.copyWith(
            //       color: (_currentIndex == 4)
            //           ? AppColors.allPrimaryColor
            //           : AppColors.cA0A0A0,
            //     ),
            //   ),
            // ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            // if (appData.read(kKeyIsLoggedIn) || index == 1 || index == 0) {
            //   if (index == 1) {
            //     context.read<SelectedSubCat>().selectedSubCatIDClear();
            //   }
            setState(() {
              _currentIndex = index;
            });
            // } else {
            //   ToastUtil.showLongToast("You need to log in first");
            // }
          },
        ),
      ),
    );
  }
}
