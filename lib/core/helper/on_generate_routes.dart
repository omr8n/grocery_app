import 'package:flutter/material.dart';

import '../../Features/root/presentation/views/root_view.dart';
import '../../features/inner_screens/auth/forget_pass.dart';

import '../../features/inner_screens/auth/register_view.dart';
import '../../features/inner_screens/auth/signin_view.dart';
import '../../features/inner_screens/product_view.dart';
import '../../features/inner_screens/fetch_screen.dart';
import '../../features/inner_screens/on_sale_view.dart';
import '../../features/inner_screens/orders/orders_view.dart';
import '../../features/inner_screens/product_details_view.dart';

import '../../features/inner_screens/viewed_recently/viewed_recently_view.dart';
import '../../features/inner_screens/wishlist/wishlist_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case ProductDetailsVeiw.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ProductDetailsVeiw());

    case RootView.routeName:
      return MaterialPageRoute(builder: (context) => const RootView());
    case FetchScreen.routeName:
      return MaterialPageRoute(builder: (context) => const FetchScreen());

    case OnSaleView.routeName:
      return MaterialPageRoute(builder: (context) => const OnSaleView());
    // case ProductsView.routeName:
    //   return MaterialPageRoute(builder: (context) => const ProductsView());
    case ProductsView.routeName:
      final args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) =>
            ProductsView(passedCategory: args is String ? args : null),
      );
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsView(),
      );
    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WishlistView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    case ViewedRecentlyView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ViewedRecentlyView(),
      );
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    // case WishlistView.routeName:
    //   return MaterialPageRoute(builder: (context) => const WishlistView());
    // case ViewedRecentlyVeiw.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ViewedRecentlyVeiw());
    // case RegisterView.routeName:
    //   return MaterialPageRoute(builder: (context) => const RegisterView());
    // case LoginView.routeName:
    //   return MaterialPageRoute(builder: (context) => const LoginView());
    // case OrdersViewFree.routeName:
    //   return MaterialPageRoute(builder: (context) => const OrdersViewFree());
    // case ForgotPasswordView.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ForgotPasswordView());
    // case SearchView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SearchView());
    // case EditOrUploadProductView.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const EditOrUploadProductView());
    // case DashboardView.routeName:
    //   return MaterialPageRoute(builder: (context) => const DashboardView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
