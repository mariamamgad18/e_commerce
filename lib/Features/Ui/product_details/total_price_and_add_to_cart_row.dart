import 'package:ecommerce/Core/Utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';

class TotalPriceAndAddToCartRow extends StatelessWidget {
  final int counter;
  final num productPrice;

  TotalPriceAndAddToCartRow({
    super.key,
    required this.counter,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = counter * productPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Total price",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                color: Appcolors.GrayColor,
              ),
            ),
            Text(
              "${totalPrice.toInt()} EGP",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
          ],
        ),

        Container(
          width: 270.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: Appcolors.primaryBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 12.0.h,
              bottom: 12.0.h,
              left: 30.w,
              right: 70.w,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(Appimages.addIcon)),
                SizedBox(width: 24.w),
                Text(
                  "Add to cart",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    color: Appcolors.WhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
