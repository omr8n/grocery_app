// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:grocery_app/core/constants/app_constants.dart';
// import 'package:grocery_app/features/root/presentation/views/root_view.dart';

// // import 'package:provider/provider.dart';

// class FetchScreen extends StatefulWidget {
//   const FetchScreen({super.key});
//   static const routeName = '/fetch-screen';
//   @override
//   State<FetchScreen> createState() => _FetchScreenState();
// }

// class _FetchScreenState extends State<FetchScreen> {
//   List<String> images = AppConstants.authImagesPaths;
//   @override
//   void initState() {
//     images.shuffle();
//     Future.delayed(const Duration(microseconds: 5), () async {
//       final productsProvider = Provider.of<ProductsProvider>(
//         context,
//         listen: false,
//       );
//       final cartProvider = Provider.of<CartProvider>(context, listen: false);
//       final wishlistProvider = Provider.of<WishlistProvider>(
//         context,
//         listen: false,
//       );
//       final User? user = authInstance.currentUser;
//       if (user == null) {
//         await productsProvider.fetchProducts();
//         cartProvider.clearLocalCart();
//         wishlistProvider.clearLocalWishlist();
//       } else {
//         await productsProvider.fetchProducts();
//         await cartProvider.fetchCart();
//         await wishlistProvider.fetchWishlist();
//       }

//       Navigator.of(
//         context,
//       ).pushReplacement(MaterialPageRoute(builder: (ctx) => RootView()));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             AppConstants.productImageUrl,
//             fit: BoxFit.cover,
//             height: double.infinity,
//           ),
//           Container(color: Colors.black.withOpacity(0.7)),
//           const Center(child: SpinKitFadingFour(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/features/root/presentation/views/root_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/cubits/products_cubit/products_cubit.dart';
// import '../../../core/cubits/cart_cubit/cart_cubit.dart';
import '../../../core/cubits/wishlist_cubit/wishlist_cubit.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});
  static const routeName = '/fetch-screen';

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  late FirebaseAuthService firebaseAuthService;
  List<String> images = AppConstants.authImagesPaths;
  @override
  void initState() {
    firebaseAuthService = FirebaseAuthService();
    super.initState();
    images.shuffle();

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final productsCubit = context.read<ProductsCubit>();
      final cartCubit = context.read<CartCubit>();
      final wishlistCubit = context.read<WishlistCubit>();
      //  final User? user = FirebaseAuth.instance.currentUser;

      if (firebaseAuthService.isLoggedIn()) {
        await productsCubit.getProducts();
        cartCubit.clearCart();
        wishlistCubit.clearWishlist();
      } else {
        await productsCubit.getProducts();
        //await cartCubit.loadCartFromFirestore();
        // await wishlistCubit.fetchWishlist();
      }

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const RootView()),
        );
      }
    });
  }

  // @override
  // void initState() async {
  //   super.initState();
  //   images.shuffle();

  //   await Future.delayed(const Duration(seconds: 17), () async {
  //     if (!mounted) return;
  //     final productsCubit = context.read<ProductsCubit>();
  //     final cartCubit = context.read<CartCubit>();
  //     final wishlistCubit = context.read<WishlistCubit>();
  //     final User? user = FirebaseAuth.instance.currentUser;

  //     if (user == null) {
  //       await productsCubit.getProducts();
  //       cartCubit.clearCart();
  //       wishlistCubit.clearWishlist();
  //     } else {
  //       await productsCubit.getProducts();
  //       // await cartCubit.fetchCart();
  //       // await wishlistCubit.();
  //     }

  //     if (mounted) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (ctx) => const RootView()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(images[0], fit: BoxFit.cover, height: double.infinity),
          Container(color: Colors.black.withOpacity(0.7)),
          const Center(child: SpinKitFadingFour(color: Colors.white)),
        ],
      ),
    );
  }
}
