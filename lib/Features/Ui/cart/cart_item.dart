import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:ecommerce/Core/Utils/AppImages.dart';
import 'package:ecommerce/Domain/entities/response/cart/cart_product.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final CartProduct getCart;

  const CartItem({super.key, required this.getCart});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = CartViewModel.get(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        width: double.infinity,
        height: 113.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Appcolors.lightBlue50, width: 1),
        ),
        child: Row(
          children: [
            // ================= IMAGE =================
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                width: 120.w,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: getCart.product.imageCover,
                placeholder: (context, url) {
                  return const Center(child: CircularProgressIndicator());
                },
                errorWidget: (context, url, error) {
                  return const Icon(Icons.image_not_supported);
                },
              ),
            ),

            SizedBox(width: 8.w),

            // ================= PRODUCT INFO =================
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getCart.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      color: Appcolors.DarkBlue,
                    ),
                  ),

                  Text(
                    getCart.product.brand.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: Appcolors.GrayColor,
                    ),
                  ),

                  Text(
                    'EGP ${getCart.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      color: Appcolors.DarkBlue,
                    ),
                  ),
                ],
              ),
            ),

            // ================= DELETE + QUANTITY =================
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ================= DELETE =================
                  InkWell(
                    onTap: () {
                      cartViewModel.deleteItemsInCart(getCart.product.id);
                    },
                    child: Image(image: AssetImage(Appimages.Delete)),
                  ),

                  // ================= QUANTITY =================
                  Container(
                    width: 122.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: Appcolors.DarkBlue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ================= MINUS =================
                          InkWell(
                            onTap: () {
                              if (getCart.count > 1) {
                                cartViewModel.updateItemsInCart(
                                  getCart.product.id,
                                  getCart.count -
                                      1, // ✅ بدل product.quantity - 1
                                );
                              }
                            },
                            child: Image(image: AssetImage(Appimages.minIcon)),
                          ),

                          // ================= COUNT =================
                          Text(
                            getCart.count.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              color: Appcolors.WhiteColor,
                            ),
                          ),

                          // ================= PLUS =================
                          InkWell(
                            onTap: () {
                              cartViewModel.updateItemsInCart(
                                getCart.product.id,
                                getCart.count + 1, // ✅ صح زي ما هي
                              );
                            },
                            child: Image(image: AssetImage(Appimages.addIcon)),
                          ),
                        ],
                      ),
                    ),
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
