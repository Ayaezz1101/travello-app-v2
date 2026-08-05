import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/data/onboardingData.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Positioned(
          top: 174.h,
          left: 45.w,
          child: Image.asset(
            model.image,
            width: 300.w,
            height: 178.h,
            fit: BoxFit.contain,
          ),
        ),
        
        Positioned(
          top: 521.h,
          left: 10.w,
          child: SizedBox(
            width: 280.w,
            child: Text(model.title, style: textTheme.displayLarge),
          ),
        ),
        Positioned(
          top: 611.h,
          left: 10.w,
          child: SizedBox(
            width: 165.w,
            child: Text(model.subTitle, style: textTheme.displayMedium),
          ),
        ),
      ],
    );
  }
}
