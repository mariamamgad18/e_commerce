import 'package:ecommerce/Core/Utils/AppColors.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_error_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/Widgets/main_loading_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/hometab/category_brand_item.dart';
import 'package:ecommerce/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Ads/cubit/ads_view_model.dart';
import 'Brands/cubit/brands_states.dart';
import 'Brands/cubit/brands_view_model.dart';
import 'categories/cubit/categories_states.dart';
import 'categories/cubit/categories_view_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  AdsViewModel adsViewModel = getIt<AdsViewModel>();

  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();

  BrandsViewModel brandsViewModel = getIt<BrandsViewModel>();

  @override
  void initState() {
    super.initState();

    categoriesViewModel.getCategories();

    brandsViewModel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnnouncent(images: adsViewModel.imagesList),

          SizedBox(height: 25.h),

          _lineBreak(title: "Categories"),

          BlocBuilder<CategoriesViewModel, CategoriesStates>(
            bloc: categoriesViewModel,

            builder: (context, state) {
              if (state is CategoriesLoadingState) {
                return MainLoadingWidget();
              } else if (state is CategoriesSuccessState) {
                return _buildCategoryBrandSection(items: state.categoriesList!);
              } else if (state is CategoriesErrorState) {
                return MainErrorWidget(
                  errorMsg: state.msg,

                  onPressed: () {
                    categoriesViewModel.getCategories();
                  },
                );
              }

              return const SizedBox();
            },
          ),

          SizedBox(height: 20.h),

          _lineBreak(title: "Brands"),

          BlocBuilder<BrandsViewModel, BrandsStates>(
            bloc: brandsViewModel,

            builder: (context, state) {
              if (state is BrandsLoadingState) {
                return MainLoadingWidget();
              } else if (state is BrandsSuccessState) {
                return _buildCategoryBrandSection(items: state.brandsList!);
              } else if (state is BrandsErrorState) {
                return MainErrorWidget(
                  errorMsg: state.msg,

                  onPressed: () {
                    brandsViewModel.getBrands();
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

ImageSlideshow _buildAnnouncent({required List<String> images}) {
  return ImageSlideshow(
    width: 398.w,

    height: 200.h,

    initialPage: 0,

    indicatorBottomPadding: 8.h,

    indicatorRadius: 5.r,

    indicatorPadding: 8.w,

    indicatorColor: Appcolors.primaryBlue,

    indicatorBackgroundColor: Appcolors.WhiteColor,

    autoPlayInterval: 3000,

    isLoop: true,

    children:
        images.map((String url) {
          return Image.asset(url);
        }).toList(),
  );
}

Widget _lineBreak({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
      Text(
        title,

        style: TextStyle(
          fontSize: 18.sp,

          fontWeight: FontWeight.w500,

          fontFamily: 'Poppins',

          color: Appcolors.DarkBlue,
        ),
      ),

      TextButton(
        onPressed: () {},

        child: Text(
          "view all",

          style: TextStyle(
            fontSize: 12.sp,

            fontWeight: FontWeight.w400,

            fontFamily: 'Poppins',

            color: Appcolors.DarkBlue,
          ),
        ),
      ),
    ],
  );
}

SizedBox _buildCategoryBrandSection({required List<dynamic> items}) {
  return SizedBox(
    height: 250.h,

    child: GridView.builder(
      scrollDirection: Axis.horizontal,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        mainAxisSpacing: 16.h,

        crossAxisSpacing: 16.w,

        childAspectRatio: 0.8,
      ),

      itemCount: items.length,

      itemBuilder: (context, index) {
        return CategoryBrandItem(
          name: items[index].name,

          image: items[index].image,
        );
      },
    ),
  );
}
