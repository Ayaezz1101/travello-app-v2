import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task2/pages/home.dart';
import 'package:task2/pages/newPassword.dart';
import 'package:task2/srvices/auth_services.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/wigets/brimaryButton.dart';
import 'package:task2/wigets/onboarding_button.dart';
import 'package:task2/wigets/otpbox.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  final bool isSignUp;

  const VerifyScreen({super.key, required this.email, this.isSignUp = true});
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final AuthService _authService = AuthService();
  int _start = 30;
  bool _isButtonDisabled = true;
  late var _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _isButtonDisabled = true;
    _start = 30;
    _timer = Stream.periodic(const Duration(seconds: 1), (i) => i)
        .take(31)
        .listen((i) {
          setState(() {
            _start = 30 - i;
            if (_start == 0) _isButtonDisabled = false;
          });
        });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 104.h,
            left: 10.w,
            child: Text('Almost there', style: textTheme.displaySmall),
          ),

          Positioned(
            top: 184.h,
            left: 10.w,
            child: SizedBox(
              width: 321.w,
              child: RichText(
                text: TextSpan(
                  style: textTheme.bodyMedium,
                  children: [
                    const TextSpan(
                      text: 'Please enter the 6-digit code sent to your email ',
                    ),
                    TextSpan(
                      text: widget.email,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' for verification.'),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 299.h,
            left: 40.w,
            child: Row(
              children: List.generate(
                6,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: OTPBox(controller: _controllers[index]),
                ),
              ),
            ),
          ),

          Positioned(
            top: 396.h,
            left: 20.w,
            child: PrimaryButton(
              text: 'Verify',
              onPressed: () async {
                String otp = _controllers.map((e) => e.text).join();

                if (otp.length == 6) {
                  bool isValid = await _authService.verifyOTP(
                    widget.email,

                    otp,

                    type: widget.isSignUp ? OtpType.signup : OtpType.recovery,
                  );

                  if (isValid) {
                    if (widget.isSignUp) {
                      Navigator.pushReplacement(
                        context,

                        FadeRoute(page: const Home()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,

                        FadeRoute(page: NewPasswordScreen(email: widget.email)),
                      );
                    }
                  } else {}
                }
              },
            ),
          ),

          Positioned(
            top: 492.h,
            left: 77.w,
            child: GestureDetector(
              onTap: _isButtonDisabled
                  ? null
                  : () async {
                      try {
                        await _authService.sendOTP(
                          widget.email,
                          type: widget.isSignUp
                              ? OtpType.signup
                              : OtpType.recovery,
                        );
                        startTimer();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("A new code has been sent!"),
                          ),
                        );
                      } catch (e) {
                        print("الخطأ الفعلي من سوبابيز: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: ${e.toString()}")),
                        );
                      }
                    },
              child: RichText(
                text: TextSpan(
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Didn’t receive any code? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Resend Again',
                      style: TextStyle(
                        color: _isButtonDisabled ? Colors.grey : Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 514.h,
            left: 103.w,
            child: Text(
              _start > 0
                  ? 'Request a new code in 00:${_start.toString().padLeft(2, '0')}s'
                  : 'You can request a new code now',
              style: textTheme.bodySmall?.copyWith(color: Colors.black54),
            ),
          ),
          Positioned(
            top: 708.h,
            left: 32.w,
            child: Transform.rotate(
              angle: 3.14159,
              child: NextStepButton(onPressed: () => Navigator.pop(context)),
            ),
          ),
        ],
      ),
    );
  }
}
