// lib/widgets/rating_tag.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// lib/widgets/rating_tag.dart
class RatingTag extends StatelessWidget {
  final double rating; 

  const RatingTag({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      // أزلنا الـ width الثابت ليصبح مرناً (Responsive)
      height: 33.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w), // تقليل البادينغ قليلاً
      decoration: BoxDecoration(
        color: const Color(0x42F3ECFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // يمنع الـ Row من أخذ عرض الشاشة كاملاً
        children: [
          Icon(Icons.star_rounded, color: const Color(0xFFFFD33C), size: 16.sp),
          SizedBox(width: 2.w), // تقليل المسافة لتوفير مساحة
          Text(
            rating.toString(),
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF9095A6),
            ),
          ),
        ],
      ),
    );
  }
}