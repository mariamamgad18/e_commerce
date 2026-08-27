import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';

class SizeContainer extends StatelessWidget {
  final int size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeContainer({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: isSelected ? Appcolors.DarkBlue : Appcolors.WhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "$size",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              color: isSelected ? Appcolors.WhiteColor : Appcolors.DarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
