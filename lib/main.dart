import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Features/Ui/cart/cubit/cart_view_model.dart';
import 'package:ecommerce/config/di.dart'
    show configureDependencies, getIt;
import 'package:ecommerce/config/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/Utils/AppRouteNames.dart';
import 'Core/cache/shared_pref_utils.dart';
import 'Features/Ui/Auth/Login/loginScreen.dart';
import 'Features/Ui/Auth/Register/RegisterScreen.dart';
import 'Features/Ui/SplashScreen/Splash_Screen.dart';
import 'Features/Ui/cart/cart_screen.dart';
import 'Features/Ui/homeScreen/home_screen.dart';
import 'Features/Ui/homeScreen/tabs/favorites_tab.dart';
import 'Features/Ui/homeScreen/tabs/hometab/home_tab.dart';
import 'Features/Ui/homeScreen/tabs/product_tab/products_tab.dart';
import 'Features/Ui/homeScreen/tabs/user_tab/user_tab.dart';
import 'Features/Ui/product_details/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CachedNetworkImage.logLevel =
      CacheManagerLogLevel.debug;

  Bloc.observer =
      MyBlocObserver();

  // =========================
  // DI
  // =========================

  configureDependencies();

  // =========================
  // SHARED PREF
  // =========================

  await SharedPrefUtils.init();

  // =========================
  // TOKEN
  // =========================

  final token =
  SharedPrefUtils.getString(
    key: 'token',
  );

  print('MAIN TOKEN = $token');

  String routeName;

  if (token == null ||
      token.isEmpty) {
    routeName =
        Approutenames.loginScreen;
  } else {
    routeName =
        Approutenames.HomeScreen;
  }

  // =========================
  // RUN APP
  // =========================

  runApp(
    MyApp(
      routeName: routeName,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String routeName;

  const MyApp({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context,) {
    return ScreenUtilInit(
      designSize:
      const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,

      builder:
          (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner:
          false,

          initialRoute:
          routeName,

          routes: {

            // =========================
            // SPLASH
            // =========================

            Approutenames.SplashScreen:
                (context) =>
                SplashScreen(),

            // =========================
            // LOGIN
            // =========================

            Approutenames.loginScreen:
                (context) =>
                Loginscreen(),

            // =========================
            // REGISTER
            // =========================

            Approutenames.RegisterScreen:
                (context) =>
                Registerscreen(),

            // =========================
            // HOME
            // =========================

            Approutenames.HomeScreen:
                (context) =>
                HomeScreen(),

            // =========================
            // HOME TAB
            // =========================

            Approutenames.Hometab:
                (context) =>
                HomeTab(),

            // =========================
            // USER TAB
            // =========================

            Approutenames.UserTab:
                (context) =>
                UserTab(),

            // =========================
            // FAVORITES
            // =========================

            Approutenames.FavTab:
                (context) =>
                FavoritesTab(),

            // =========================
            // CART
            // =========================

            Approutenames.CartScreen:
                (context) =>
                BlocProvider(
                  create: (_) =>
                  getIt<
                      CartViewModel>()
                    ..getItemsInCart(),

                  child:
                  const CartScreen(),
                ),

            // =========================
            // PRODUCTS
            // =========================

            Approutenames.ProductTab:
                (context) =>
                ProductsTab(),
          },

          // =========================
          // GENERATED ROUTES
          // =========================

          onGenerateRoute:
              (settings) {
            if (settings.name ==
                Approutenames
                    .ProductDetailsScreen) {
              final productId =
              settings.arguments
              as String;

              return MaterialPageRoute(
                builder: (_) =>
                    ProductDetailsScreen(
                      productId:
                      productId,
                    ),
              );
            }

            return null;
          },
        );
      },
    );
  }
}