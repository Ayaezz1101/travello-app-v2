import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/theme/themeData.dart';
import '../model/product_model.dart'; 

class ColorSelector extends StatelessWidget {
  final List<ColorOption> colors;
  final int selectedIndex;
  final Function(int) onColorSelected; 

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: const Color(0xFF100D25),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: List.generate(colors.length, (index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => onColorSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.only(right: 12.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: isSelected ? AppTheme.primaryColor : const Color(0xFFDDDEE3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: colors[index].color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      colors[index].name,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: isSelected ? AppTheme.primaryColor : const Color(0xFF9095A6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}