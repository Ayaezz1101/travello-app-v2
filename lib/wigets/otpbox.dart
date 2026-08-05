import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart';

class OTPBox extends StatelessWidget {
  final TextEditingController controller; // إضافة المتحكم

  const OTPBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: AppTheme.fieldGrey,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextField(controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus(); 
        },
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}