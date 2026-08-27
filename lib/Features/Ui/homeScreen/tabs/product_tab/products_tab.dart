import 'package:ecommerce/Features/Ui/cart/cubit/cart_states.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_error_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_loading_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/product_tab/cubit/Product_tab_view_model.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/product_tab/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Utils/snackbar_utils.dart';
import '../../../../../config/di.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    super.initState();

    productTabViewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartViewModel, CartStates>(
      listener: (context, state) {
        if (state is AddCartSuccessState) {
          SnackbarUtils.showSuccess(
            context,
            message: 'Product added successfully to cart',
          );
        }

        if (state is CartErrorState) {
          SnackbarUtils.showError(context, message: state.errorMsg);
        }
      },
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        bloc: productTabViewModel,
        builder: (context, state) {
          if (state is ProductTabErrorState) {
            return MainErrorWidget(errorMsg: state.ErrorMsg);
          }

          if (state is ProductTabSuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 16,
                childAspectRatio: 2 / 3.2,
              ),
              itemCount: state.productList?.length ?? 0,
              itemBuilder: (context, index) {
                final product = state.productList![index];

                return ProductTabItem(product: product);
              },
            );
          }

          return const MainLoadingWidget();
        },
      ),
    );
  }
}
