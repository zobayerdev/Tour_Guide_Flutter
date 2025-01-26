import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onCallBack,
    this.leadingIconUnVisible = false,
    this.actions,
    this.isCenterd = false,
  });

  final String? title;
  final VoidCallback? onCallBack;
  final bool leadingIconUnVisible;
  final List<Widget>? actions;
  final bool isCenterd;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingIconUnVisible
          ? null
          : Padding(
              padding: EdgeInsets.all(14.sp),
              child: InkWell(
                onTap: () {
                  NavigationService.goBack;
                },
                child: SvgPicture.asset(
                  Assets.icons.arrowPrevious,
                  height: 28.h,
                  width: 28.w,
                ),
              ),
            ),
      backgroundColor: Colors.white,
      centerTitle: isCenterd,
      title: Text(
        title ?? '',
        style: TextFontStyle.headline18w600c141414StyledmPoppins,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
