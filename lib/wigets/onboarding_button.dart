import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart';
class NextStepButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextStepButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: const BoxDecoration(
          color: AppTheme.accentColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            weight: 3, 
          ),
        ),
      ),
    );
  }
}