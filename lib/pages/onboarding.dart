import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/data/onboardingData.dart';
import 'package:task2/pages/signIn.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/wigets/indicator.dart';
import 'package:task2/wigets/onboarding_button.dart';
import 'package:task2/wigets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingContents.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingItem(model: onboardingContents[index]);
            },
          ),

          Positioned(
            top: 678.h,
            left: 10.w,
            child: CustomPageIndicator(currentIndex: _currentIndex),
          ),
          SizedBox(height: 3),
          Positioned(
            top: 678.h,
            left: 282.w,
            child: NextStepButton(
              onPressed: () {
                if (_currentIndex < onboardingContents.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    FadeRoute(page: const SignInScreen()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
