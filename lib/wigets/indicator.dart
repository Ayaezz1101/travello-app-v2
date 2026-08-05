import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart';
class CustomPageIndicator extends StatelessWidget {
  final int currentIndex;
  const CustomPageIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: 3.w),
          width: currentIndex == index ? 16.w : 13.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppTheme.primaryColor : AppTheme.lightPink,
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }
}