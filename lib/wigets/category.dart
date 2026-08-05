import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task2/providors/product_providor.dart';
import 'package:task2/theme/themeData.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final List<String> categoryList = [
    'Smart Watch',
    'Apple',
    'Samsung',
    'Xiaomi',
    'Huawei',
  ];
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 24.w),
      child: SizedBox(
        width: 327.w,
        height: 28.h, 
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal, 
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            
            return GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                context.read<ProductProvider>().fetchProducts(
                  categoryName: categoryList[index],
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.w), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryList[index],
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14.sp,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? AppTheme.primaryColor : AppTheme.secondaryColor,
                      ),
                    ),
                    if (isSelected) 
                      Container(
                        margin: EdgeInsets.only(top: 4.h),
                        width: 38.w,
                        height: 1.h,
                        color: AppTheme.primaryColor,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}