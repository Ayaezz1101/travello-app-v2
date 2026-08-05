
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task2/pages/home.dart';
import 'package:task2/pages/signUp.dart';
import 'package:task2/pages/verify.dart';
import 'package:task2/srvices/auth_services.dart';
import 'package:task2/srvices/pageTransition.dart';
import 'package:task2/theme/themeData.dart';
import 'package:task2/wigets/brimaryButton.dart';
import 'package:task2/wigets/textField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 390.w,
            height: 844.h,
            child: Stack(
              children: [
                Positioned(
                  top: 46.h,
                  left: 74.w,
                  child: Image.asset(
                    'assets/images/undraw_adventure_map_hnin 2.png',
                    width: 321.w,
                    height: 251.h,
                  ),
                ),

                Positioned(
                  top: 184.h,
                  left: 102.w,
                  child: Text('Welcome back', style: textTheme.titleMedium),
                ),
                Positioned(
                  top: 217.h,
                  left: 100.w,
                  child: Text(
                    'sign in to access your account',
                    style: textTheme.bodyMedium,
                  ),
                ),

                Positioned(
                  top: 342.h,
                  left: 20.w,
                  child: CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    suffixIcon: Icons.email_outlined,
                    validator: (value) =>
                        value!.contains('@') ? null : 'Invalid email format',
                  ),
                ),
                Positioned(
                  top: 404.h,
                  left: 20.w,
                  child: CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    suffixIcon: Icons.visibility_off_outlined,
                    isPassword: true,
                    validator: (value) =>
                        value!.length < 6 ? 'Password too short' : null,
                  ),
                ),

                Positioned(
                  top: 468.h,
                  left: 22.w,
                  child: Row(
                    children: [
                      Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: const Color(0xFFCBCBCB)),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 9.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Positioned(
  top: 468.h,
  left: 299.w,
  child: GestureDetector(
    onTap: () async {
      final email = _emailController.text.trim();
      if (email.isNotEmpty) {
        try {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );

          await _authService.resetPasswordRequest(email);

          Navigator.pop(context);

          Navigator.push(
            context,
            FadeRoute(
              page: VerifyScreen(email: email ,isSignUp: false,),
            ),
          );
        } catch (e) {
          Navigator.pop(context); 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${e.toString()}")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your email first")),
        );
      }
    },
    child: Text(
      'Forget password?',
      style: TextStyle(
        fontSize: 9.sp,
        color: AppTheme.primaryColor,
      ),
    ),
  ),
),
                Positioned(
                  top: 726.h,
                  left: 20.w,
                  child: PrimaryButton(
                    text: 'Next',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        User?  user = await _authService.signIn(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            FadeRoute(page: Home()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Failed")),
                          );
                        }
                      }
                    },
                  ),
                ),

                Positioned(
                  top: 790.h,
                  left: 107.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        FadeRoute(page: const SignUpScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: textTheme.bodySmall,
                        children: [
                          const TextSpan(
                            text: 'New member? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
