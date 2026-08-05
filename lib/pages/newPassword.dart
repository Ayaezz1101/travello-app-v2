import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/pages/signIn.dart';
import 'package:task2/srvices/auth_services.dart';
import 'package:task2/wigets/brimaryButton.dart';
import 'package:task2/wigets/textField.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  const NewPasswordScreen({super.key, required this.email});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Text("Create a new password for ${widget.email}"),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: "enter your new password",
              suffixIcon: Icons.visibility_off_outlined,
              isPassword: true,
              controller: _passwordController,
              validator: (value) => value!.length < 6 ? "min 6 digits" : null,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: "confirm password",
              suffixIcon: Icons.visibility_off_outlined,
              isPassword: true,
              controller: _confirmController,
              validator: (value) => value!.length < 6 ? "min 6 digits" : null,
            ),
            SizedBox(height: 40.h),
            PrimaryButton(text: "update password", onPressed: () async {
                if (_passwordController.text == _confirmController.text) {
                  bool success = await _authService.updatePassword(
                    _passwordController.text,
                  );
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password updated! Please login."),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                      (route) => false,
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("The passwords do not match."),
                    ),
                  );
                }
              },) ,
           
          ],
        ),
      ),
    );
  }
}
