import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../core/utils/utils.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({super.key});

  @override
  State<ViewedRecentlyWidget> createState() => _ViewedWidgetState();
}

class _ViewedWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    //  final productProvider = Provider.of<ProductsProvider>(context);

    // final viewedProdModel = Provider.of<ViewedProdModel>(context);

    // final getCurrProduct =
    //     productProvider.findProdById(viewedProdModel.productId);
    // double usedPrice = getCurrProduct.isOnSale
    //     ? getCurrProduct.salePrice
    //     : getCurrProduct.price;
    // final cartProvider = Provider.of<CartProvider>(context);
    // bool? _isInCart = cartProvider.getCartItems.containsKey(getCurrProduct.id);

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // GlobalMethods.navigateTo(
          //     ctx: context, routeName: ProductDetails.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FancyShimmerImage(
              // imageUrl: getCurrProduct.imageUrl,
              imageUrl: AppConstants.productImageUrl,
              boxFit: BoxFit.fill,
              height: size.width * 0.27,
              width: size.width * 0.25,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: [
                CustomText(
//text: getCurrProduct.title,
                  text: "few",

                  fontSize: 24,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomText(
                  //  text: '\$${usedPrice.toStringAsFixed(2)}',
                  text: "\$543",

                  fontSize: 20,
                  isTitle: false,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
                child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    // onTap: _isInCart
                    //     ? null
                    //     : () async {
                    //         final User? user = authInstance.currentUser;

                    //         if (user == null) {
                    //           GlobalMethods.errorDialog(
                    //               subtitle: 'No user found, Please login first',
                    //               context: context);
                    //           return;
                    //         }
                    //         await GlobalMethods.addToCart(
                    //             productId: getCurrProduct.id,
                    //             quantity: 1,
                    //             context: context);
                    //         await cartProvider.fetchCart();
                    //         // cartProvider.addProductsToCart(
                    //         //   productId: getCurrProduct.id,
                    //         //   quantity: 1,
                    //         // );
                    //       },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        IconlyBold.plus,
                        color: Colors.white,
                        size: 20,
                      ),
                      // child: Icon(
                      //   _isInCart ? Icons.check : IconlyBold.plus,
                      //   color: Colors.white,
                      //   size: 20,
                      // ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
