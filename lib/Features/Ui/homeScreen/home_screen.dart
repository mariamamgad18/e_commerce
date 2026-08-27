import 'package:ecommerce/Core/Utils/AppImages.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:ecommerce/Features/Ui/homeScreen/Widgets/badge_widget.dart';
import 'package:ecommerce/Features/Ui/homeScreen/cubit/home_screen_states.dart';
import 'package:ecommerce/Features/Ui/homeScreen/cubit/home_screen_view_model.dart';
import 'package:ecommerce/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/AppColors.dart';
import 'bottom_navigation_bar/bottom_nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenViewModel>(
          create: (context) => getIt<HomeScreenViewModel>(),
        ),

        BlocProvider<CartViewModel>(
          create: (context) {
            final cartViewModel = getIt<CartViewModel>();

            cartViewModel.getItemsInCart();

            return cartViewModel;
          },
        ),
      ],

      child: BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
        builder: (context, state) {
          final viewModel = context.watch<HomeScreenViewModel>();

          return Scaffold(
            backgroundColor: Appcolors.WhiteColor,

            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Appcolors.primaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),

                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,

                  currentIndex: viewModel.currentindex,

                  onTap: viewModel.bottomNavOnTab,

                  type: BottomNavigationBarType.fixed,

                  showSelectedLabels: false,
                  showUnselectedLabels: false,

                  items: [
                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: BottomNavItem(
                          isSelected: viewModel.currentindex == 0,
                          selectedimage: Appimages.selectedHomeTab,
                          unselectedimage: Appimages.unselectedHomeTab,
                        ),
                      ),
                    ),

                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: BottomNavItem(
                          isSelected: viewModel.currentindex == 1,
                          selectedimage: Appimages.selectedCategoryTab,
                          unselectedimage: Appimages.unselectedCategoryTab,
                        ),
                      ),
                    ),

                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: BottomNavItem(
                          isSelected: viewModel.currentindex == 2,
                          selectedimage: Appimages.selectedHeartTab,
                          unselectedimage: Appimages.unselectedHeartTab,
                        ),
                      ),
                    ),

                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: BottomNavItem(
                          isSelected: viewModel.currentindex == 3,
                          selectedimage: Appimages.selectedProfileTab,
                          unselectedimage: Appimages.unselectedProfileTab,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            body: Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 10.h),

                  Image(
                    image: AssetImage(Appimages.RouteLogoWithOutBackGround),
                  ),

                  SizedBox(height: 10.h),

                  if (viewModel.currentindex != 3)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,

                            decoration: BoxDecoration(
                              color: Appcolors.WhiteColor,

                              borderRadius: BorderRadius.circular(25.r),

                              border: Border.all(
                                color: Appcolors.primaryBlue,
                                width: 2,
                              ),
                            ),

                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 13.h,
                                bottom: 13.h,
                                left: 25.w,
                              ),

                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(Appimages.SearchIcon),
                                  ),

                                  SizedBox(width: 3.w),

                                  Text(
                                    "what do you search for?",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      color: Appcolors.primaryBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 15.w),
                        BadgeWidget(),
                      ],
                    ),

                  SizedBox(height: 16.h),

                  Expanded(child: viewModel.bodyList[viewModel.currentindex]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
