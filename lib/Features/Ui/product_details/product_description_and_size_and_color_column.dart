import 'package:ecommerce/Features/Ui/product_details/size_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Domain/entities/response/product/product_data.dart';
import 'color_container.dart';

class ProductDescriptionAndSizeAndColorColumn extends StatefulWidget {
  final ProductData product;

  ProductDescriptionAndSizeAndColorColumn({super.key, required this.product});

  @override
  State<ProductDescriptionAndSizeAndColorColumn> createState() =>
      _ProductDescriptionAndSizeAndColorColumnState();
}

class _ProductDescriptionAndSizeAndColorColumnState
    extends State<ProductDescriptionAndSizeAndColorColumn> {
  bool isExpanded = false;

  final List<int> sizes = [38, 39, 40, 41, 42];
  final List<Color> colors = [
    Appcolors.DarkBlue,
    Appcolors.primaryBlue,
    Appcolors.lightBlue50,
  ];

  int? selectedSize;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        //todo:Description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
            SizedBox(height: 8.h),

            ReadMoreText(
              widget.product.description ?? "",
              trimExpandedText: 'Read Less',
              trimCollapsedText: 'Ream More',
              trimLines: 2,
              trimMode: TrimMode.Line,
              colorClickableText: Appcolors.primaryBlue,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),
        //todo:Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Size",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return SizeContainer(
                    size: sizes[index],
                    isSelected: selectedSize == sizes[index],
                    onTap: () {
                      setState(() {
                        selectedSize = sizes[index];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                color: Appcolors.DarkBlue,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return ColorContainer(
                    color: colors[index],
                    isSelected: selectedColor == colors[index],
                    onTap: () {
                      setState(() {
                        selectedColor = colors[index];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
