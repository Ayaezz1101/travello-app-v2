import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2/model/product_model.dart';
import 'package:task2/wigets/brimaryButton.dart'; 
import 'package:task2/wigets/color_selector.dart';
import 'package:task2/wigets/indicator.dart';
import 'package:task2/wigets/rating.dart';
import 'package:task2/wigets/tab.dart'; 

class Details extends StatefulWidget {
  final Product product;
  const Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isFavourite = false;
  int _selectedColorIndex = 0;
  bool showDetails = true;

  @override
  Widget build(BuildContext context) {
    String currentImagePath = widget.product.colors.isNotEmpty
        ? widget.product.colors[_selectedColorIndex].imagePath
        : widget.product.imageUrl;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 68.h, left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new, size: 24.sp, color: const Color(0xFF100D25)),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => isFavourite = !isFavourite),
                      child: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        size: 24.sp,
                        color: isFavourite ? Colors.red : const Color(0xFF100D25),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 375.w,
                height: 380.h,
                color: const Color(0xFFFBFBFB),
                child: Center(
                  child: Hero(
                    tag: widget.product.id,
                    child: Image.asset(
                      currentImagePath,
                      width: 319.w,
                      height: 319.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPageIndicator(currentIndex: _selectedColorIndex),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 46.h, left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: const Color(0xFF100D25)),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "( With solo loop )",
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0xFF9095A6)),
                          ),
                        ],
                      ),
                    ),
                    RatingTag(rating: widget.product.rating),
                  ],
                ),
              ),

              // 5. Colors Selector
              if (widget.product.colors.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
                  child: ColorSelector(
                    colors: widget.product.colors,
                    selectedIndex: _selectedColorIndex,
                    onColorSelected: (index) {
                      setState(() {
                        _selectedColorIndex = index;
                      });
                    },
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomTabItem(
                          title: "Details",
                          isSelected: showDetails,
                          onTap: () => setState(() => showDetails = true),
                        ),
                        SizedBox(width: 20.w),
                        CustomTabItem(
                          title: "Review",
                          isSelected: !showDetails,
                          onTap: () => setState(() => showDetails = false),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        showDetails ? widget.product.description : widget.product.reviews,
                        key: ValueKey<bool>(showDetails),
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 1.5,
                          letterSpacing: 0.03,
                          color: const Color(0xFF9095A6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
                child: PrimaryButton(
                  text: "Add to Cart | \$${widget.product.price}",
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}