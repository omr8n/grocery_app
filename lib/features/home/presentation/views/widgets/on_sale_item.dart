import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/constants/app_constants.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/heart_btn.dart';
import 'price_item.dart';

class OnSaleItem extends StatefulWidget {
  const OnSaleItem({super.key});

  @override
  State<OnSaleItem> createState() => _OnSaleItemState();
}

class _OnSaleItemState extends State<OnSaleItem> {
  @override
  Widget build(BuildContext context) {
    //  final Color color = Utils(context).color;
    // final productModel = Provider.of<ProductModel>(context);
    // final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    // final cartProvider = Provider.of<CartProvider>(context);
    // bool? _isInCart = cartProvider.getCartItems.containsKey(productModel.id);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    // bool? _isInWishlist =
    //     wishlistProvider.getWishlistItems.containsKey(productModel.id);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        splashColor: const Color.fromARGB(255, 77, 121, 142),
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Navigator.pushNamed(context, ProductDetails.routeName,
          //     arguments: productModel.id);
          // GlobalMethods.navigateTo(
          //     ctx: context, routeName: ProductDetails.routeName);
        },
        child: Material(
          // color: Theme.of(context).scaffoldBackgroundColor,
          color: Theme.of(context).cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        //  imageUrl: productModel.imageUrl,
                        imageUrl:
                            "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
                        height: size.width * 0.22,
                        width: size.width * 0.22,
                        boxFit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          CustomText(
                            //text: productModel.isPiece ? '1Piece' : '1KG',
                            text: "1KG",
                            // color: color,

                            fontSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                // onTap: _isInCart
                                //     ? null
                                //     : () async {
                                //         final User? user =
                                //             authInstance.currentUser;

                                //         if (user == null) {
                                //           GlobalMethods.errorDialog(
                                //               subtitle:
                                //                   'No user found, Please login first',
                                //               context: context);
                                //           return;
                                //         }
                                //         await GlobalMethods.addToCart(
                                //             productId: productModel.id,
                                //             quantity: 1,
                                //             context: context);
                                //         await cartProvider.fetchCart();
                                //         // cartProvider.addProductsToCart(
                                //         //     productId: productModel.id,
                                //         //     quantity: 1);
                                //       },
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: Colors.green,
                                ),
                                // child: Icon(
                                //   _isInCart
                                //       ? IconlyBold.bag2
                                //       : IconlyLight.bag2,
                                //   size: 22,
                                //   color: _isInCart ? Colors.green : color,
                                // ),
                              ),
                              HeartBTN(
                                // productId: productModel.id,
                                // isInWishlist: _isInWishlist,
                                productId: " productModel.id",
                                isInWishlist: true,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  PriceItem(
                    // salePrice: productModel.salePrice,
                    // price: productModel.price,
                    salePrice: 21,
                    price: 32,
                    textPrice: '1',
                    isOnSale: true,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    // text: productModel.title,
                    text: "234",
                    // color: color
                    color: const Color.fromARGB(255, 55, 61, 153),
                    fontSize: 16,
                    isTitle: true,
                  ),
                  const SizedBox(height: 5),
                ]),
          ),
        ),
      ),
    );
  }
}
