import 'package:flutter/material.dart';

import '../../Features/root/presentation/views/root_view.dart';
import '../../features/inner_screens/auth/forget_pass.dart';
import '../../features/inner_screens/auth/login.dart';
import '../../features/inner_screens/auth/register_view.dart';
import '../../features/inner_screens/feeds_screen.dart';
import '../../features/inner_screens/on_sale_view.dart';
import '../../features/inner_screens/orders/orders_view.dart';
import '../../features/inner_screens/product_details_view.dart';
import '../../features/inner_screens/viewed_recently/viewed_recently.dart';

import '../../features/inner_screens/wishlist/wishlist_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case ProductDetailsVeiw.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => const ProductDetailsVeiw());

    case RootView.routeName:
      return MaterialPageRoute(builder: (context) => const RootView());

    case OnSaleView.routeName:
      return MaterialPageRoute(builder: (context) => const OnSaleView());
    case FeedsView.routeName:
      return MaterialPageRoute(builder: (context) => const FeedsView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ProductDetailsView());
    case WishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WishlistView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    case ViewedRecentlyView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ViewedRecentlyView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
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
