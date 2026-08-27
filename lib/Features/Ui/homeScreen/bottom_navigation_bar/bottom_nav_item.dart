import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem({
    super.key,
    required this.isSelected,
    required this.selectedimage,
    required this.unselectedimage,
  });

  final String selectedimage;
  final String unselectedimage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: isSelected ? Appcolors.WhiteColor : Appcolors.transparent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child:
            isSelected
                ? Image(image: AssetImage(selectedimage))
                : Image(image: AssetImage(unselectedimage)),
      ),
    );
  }
}
