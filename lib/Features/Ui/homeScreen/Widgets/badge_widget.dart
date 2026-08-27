import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Utils/AppImages.dart';
import '../../../../config/di.dart';
import '../../cart/cart_screen.dart';
import '../../cart/cubit/cart_states.dart';
import '../../cart/cubit/cart_view_model.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
      builder: (context, state) {
        int numberOfItems = 0;

        if (state is GetCartSuccessState) {
          numberOfItems = state.numberOfItems;
        }

        if (state is AddCartSuccessState) {
          numberOfItems = state.numberOfItems;
        }

        print("BADGE STATE = ${state.runtimeType}");
        print("BADGE NUMBER = $numberOfItems");

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider(
                      create: (_) => getIt<CartViewModel>()..getItemsInCart(),
                      child: CartScreen(),
                    ),
              ),
            );
          },
          child: Badge(
            alignment: AlignmentDirectional.topStart,
            backgroundColor: Colors.green,

            label: Text(numberOfItems.toString()),

            child: ImageIcon(AssetImage(Appimages.CartIcon), size: 30.sp),
          ),
        );
      },
    );
  }
}
