import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onFilterTap;

  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 11.h, left: 24.w),
      child: SizedBox(
        width: 327.w,
        height: 48.h,
        child: Row(
         // gap: 16.w,
          children: [
            Container(
              width: 279.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44.r),
                border: Border.all(color: const Color(0xFFDDDEE3), width: 1.w),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: "Search Product",
                  hintStyle: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0xFF9095A6),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.w), 
                    child: Icon(
                      Icons.search,
                      size: 20.sp,
                      color: const Color(0xFF100D25), 
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: onFilterTap,
              child: Container(
                width: 32.w, 
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Icon(
                  Icons.filter_list, 
                  size: 24.sp,
                  color: const Color(0xFF100D25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}