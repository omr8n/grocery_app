import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery_app/core/constants/app_constants.dart';

import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  List<String> images = AppConstants.authImagesPaths;
  @override
  void initState() {
    // images.shuffle();
    // Future.delayed(const Duration(microseconds: 5), () async {
    //   final productsProvider =
    //       Provider.of<ProductsProvider>(context, listen: false);
    //   final cartProvider = Provider.of<CartProvider>(context, listen: false);
    //   final wishlistProvider =
    //       Provider.of<WishlistProvider>(context, listen: false);
    //   final User? user = authInstance.currentUser;
    //   if (user == null) {
    //     await productsProvider.fetchProducts();
    //     cartProvider.clearLocalCart();
    //     wishlistProvider.clearLocalWishlist();
    //   } else {
    //     await productsProvider.fetchProducts();
    //     await cartProvider.fetchCart();
    //     await wishlistProvider.fetchWishlist();
    //   }

    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (ctx) => const BottomBarScreen(),
    //   ));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppConstants.productImageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const Center(
            child: SpinKitFadingFour(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
