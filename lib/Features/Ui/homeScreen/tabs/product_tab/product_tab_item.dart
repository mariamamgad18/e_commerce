import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:ecommerce/Core/Utils/AppImages.dart';
import 'package:ecommerce/Core/Utils/AppRouteNames.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Domain/entities/response/product/product_data.dart';

class ProductTabItem extends StatefulWidget {
  final ProductData product;

  const ProductTabItem({super.key, required this.product});

  @override
  State<ProductTabItem> createState() => _ProductTabItemState();
}

class _ProductTabItemState extends State<ProductTabItem> {
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Approutenames.ProductDetailsScreen,
          arguments: widget.product.id,
        );
      },

      child: Container(
        width: 185.w,
        height: 230.h,

        decoration: BoxDecoration(
          color: Appcolors.WhiteColor,

          borderRadius: BorderRadius.circular(15.r),

          border: Border.all(color: Appcolors.lightBlue50, width: 2),
        ),

        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                  ),

                  child: Image.network(
                    widget.product.imageCover ?? "",
                    width: double.infinity,
                    height: 160.h,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8.h,
                  right: 3.w,

                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },

                    child: Image(
                      image: AssetImage(
                        isLiked ? Appimages.Unlike : Appimages.like,
                      ),

                      fit: BoxFit.fill,

                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    widget.product.title ?? "",

                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: Appcolors.DarkBlue,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Text(
                        "EGP ${widget.product.price ?? 0}",

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.DarkBlue,
                        ),
                      ),

                      SizedBox(width: 15.w),

                      Text(
                        "1.200 EGP",

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.GrayColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Text(
                        "Review",

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.DarkBlue,
                        ),
                      ),

                      SizedBox(width: 4.w),

                      Text(
                        "(${widget.product.ratingsAverage ?? 0})",

                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.DarkBlue,
                        ),
                      ),

                      SizedBox(width: 4.w),

                      Image(image: AssetImage(Appimages.StarImage)),

                      const Spacer(),

                      InkWell(
                        onTap: () {
                          final productId = widget.product.id;

                          if (productId != null && productId.isNotEmpty) {
                            CartViewModel.get(context).addToCart(productId);
                          }
                        },

                        child: Container(
                          width: 30.w,
                          height: 30.h,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Appcolors.DarkBlue,
                          ),

                          child: Center(
                            child: Icon(Icons.add, color: Appcolors.WhiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
