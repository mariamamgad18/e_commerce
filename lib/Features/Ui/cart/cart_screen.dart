import 'package:ecommerce/Features/Ui/cart/cart_item.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_error_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Core/Utils/AppImages.dart';
import '../homeScreen/Widgets/badge_widget.dart';
import 'cubit/cart_states.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // =========================
  // CALCULATE TOTAL PRICE
  // =========================

  double calculateTotalPrice(List products) {
    double total = 0;

    for (final product in products) {
      total += product.price * product.count;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.WhiteColor,

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: Appcolors.WhiteColor,
        centerTitle: true,
        elevation: 0,

        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            fontFamily: 'Poppins',
            color: Appcolors.DarkBlue,
          ),
        ),

        actions: [
          Image(image: AssetImage(Appimages.SearchIcon)),

          SizedBox(width: 30.w),

          const BadgeWidget(),

          SizedBox(width: 15.w),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          // =========================
          // GENERAL ERROR
          // =========================

          if (state is CartErrorState) {
            return MainErrorWidget(errorMsg: state.errorMsg);
          }

          // =========================
          // DELETE ERROR
          // =========================

          if (state is DeleteCartErrorState) {
            return MainErrorWidget(errorMsg: state.errorMsg);
          }

          // =========================
          // UPDATE ERROR
          // =========================

          if (state is UpdateCartErrorState) {
            return MainErrorWidget(errorMsg: state.errorMsg);
          }

          // =========================
          // LOADING
          // =========================

          if (state is CartLoadingState ||
              state is DeleteCartLoadingState ||
              state is UpdateCartLoadingState) {
            return const MainLoadingWidget();
          }

          // =========================
          // SUCCESS
          // =========================

          if (state is GetCartSuccessState ||
              state is UpdateCartSuccessState ||
              state is DeleteCartSuccessState) {
            final products = _getProducts(state);

            final totalPrice = calculateTotalPrice(products);

            return _buildCartBody(products, totalPrice);
          }

          // =========================
          // INITIAL
          // =========================

          return const MainLoadingWidget();
        },
      ),
    );
  }

  // =========================
  // GET PRODUCTS
  // =========================

  List _getProducts(CartStates state) {
    if (state is GetCartSuccessState) {
      return state.response.products;
    }

    if (state is UpdateCartSuccessState) {
      return state.response.products;
    }

    if (state is DeleteCartSuccessState) {
      return state.response.products;
    }

    return [];
  }

  // =========================
  // CART BODY
  // =========================

  Widget _buildCartBody(List products, double totalPrice) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          // =========================
          // PRODUCTS
          // =========================
          Expanded(
            child:
                products.isEmpty
                    ? Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.GrayColor,
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CartItem(getCart: products[index]);
                      },
                    ),
          ),

          SizedBox(height: 10.h),

          // =========================
          // TOTAL
          // =========================
          Container(
            width: double.infinity,
            height: 120.h,
            color: Appcolors.WhiteColor,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  // =========================
                  // TOTAL PRICE
                  // =========================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.GrayColor,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        'EGP ${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          color: Appcolors.DarkBlue,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 30.w),

                  // =========================
                  // CHECKOUT
                  // =========================
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.DarkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),

                        onPressed: () {},

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                fontFamily: 'Poppins',
                                color: Appcolors.WhiteColor,
                              ),
                            ),

                            SizedBox(width: 15.w),

                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Appcolors.WhiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
