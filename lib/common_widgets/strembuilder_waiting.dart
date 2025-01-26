import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../helpers/navigation_service.dart';
import 'loading_indicators.dart';

class StremBuilderWaitingWidget extends StatelessWidget {
  const StremBuilderWaitingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        SizedBox(
          height: 150.h,
        ),
        Center(
            child: shimmer(
                context: NavigationService.context,
                name: Assets.lottie.waiting,
                size: 220.sp)),
      ],
    ));
  }
}
