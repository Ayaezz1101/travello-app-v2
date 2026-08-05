import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart'; 
class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData suffixIcon;
  final bool isPassword;
  final TextEditingController controller; // إضافة المتحكم
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: _obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.fieldGrey,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0x80000000)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          errorStyle: TextStyle(fontSize: 10.sp),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: const Color(0xFF252525),
                    size: 24.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Icon(widget.suffixIcon, color: const Color(0xFF252525), size: 24.sp),
        ),
      ),
    );
  }
}