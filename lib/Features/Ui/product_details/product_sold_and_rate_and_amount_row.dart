import 'package:ecommerce/Domain/entities/response/product/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Core/Utils/AppImages.dart';

class ProductSoldAndRateAndAmountRow extends StatefulWidget {
  int Counter = 0;
  final Function(int) onCounterChanged;
  final ProductData Product;

  ProductSoldAndRateAndAmountRow({
    super.key,
    required this.Counter,
    required this.onCounterChanged,
    required this.Product,
  });

  @override
  State<ProductSoldAndRateAndAmountRow> createState() =>
      _ProductSoldAndRateAndAmountRowState();
}

class _ProductSoldAndRateAndAmountRowState
    extends State<ProductSoldAndRateAndAmountRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //todo : sold Container
        Container(
          width: 102.w,
          height: 34.h,
          decoration: BoxDecoration(
            border: Border.all(color: Appcolors.lightBlue50),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              "${widget.Product.sold ?? 0} Sold",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        //todo: rate row
        Row(
          children: [
            Image(image: AssetImage(Appimages.StarImage)),
            Text(
              "${widget.Product.ratingsAverage ?? 0} (${widget.Product.ratingsQuantity ?? 0})",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
          ],
        ),
        SizedBox(width: 66.w),

        //todo:add container
        Container(
          width: 122.w,
          height: 42.h,

          decoration: BoxDecoration(
            color: Appcolors.DarkBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (widget.Counter > 0) {
                      widget.onCounterChanged(widget.Counter - 1);
                    }
                  },

                  child: Image(image: AssetImage(Appimages.minIcon)),
                ),
                Text(
                  "${widget.Counter}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    color: Appcolors.WhiteColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.onCounterChanged(widget.Counter + 1);
                  },

                  child: Image(image: AssetImage(Appimages.addIcon)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
