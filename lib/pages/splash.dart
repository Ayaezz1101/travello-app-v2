// ignore_for_file: unnecessary_underscores
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/pages/onboarding.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/theme/themeData.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context, 
          FadeRoute(page: const OnboardingScreen()) 
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/undraw_floating_re_xtcj 1.png', 
              width: 150.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.h),
            Text(
              'Travello', 
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 48.sp, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}