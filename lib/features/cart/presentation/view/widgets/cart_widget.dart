import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/core/widgets/quantity_controller.dart';

// import 'package:provider/provider.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/heart_btn.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});
  // final int q;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    // _quantityTextController.text = widget.q.toString();
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    // final productProvider = Provider.of<ProductsProvider>(context);
    // final cartModel = Provider.of<CartModel>(context);
    // final getCurrProduct = productProvider.findProdById(cartModel.productId);
    // double usedPrice = getCurrProduct.isOnSale
    //     ? getCurrProduct.salePrice
    //     : getCurrProduct.price;
    // final cartProvider = Provider.of<CartProvider>(context);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    // bool? _isInWishlist =
    //     wishlistProvider.getWishlistItems.containsKey(getCurrProduct.id);
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, ProductDetails.routeName,
        //     arguments: cartModel.productId);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: FancyShimmerImage(
                        imageUrl:
                            "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
                        // imageUrl: getCurrProduct.imageUrl,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "gewf",

                          // text: getCurrProduct.title,
                          fontSize: 20,
                          isTitle: true,
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Row(
                            children: [
                              QuantityController(
                                padding: 5,
                                onTap: () {
                                  if (_quantityTextController.text == '1') {
                                    return;
                                  } else {
                                    // cartProvider.reduceQuantityByOne(
                                    //     cartModel.productId);
                                    setState(() {
                                      _quantityTextController.text =
                                          (int.parse(
                                                    _quantityTextController
                                                        .text,
                                                  ) -
                                                  1)
                                              .toString();
                                    });
                                  }
                                },
                                color: Colors.red,
                                icon: CupertinoIcons.minus,
                              ),
                              Flexible(
                                flex: 2,
                                child: Center(
                                  child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'),
                                      ),
                                    ],
                                    // onChanged: (value) {
                                    //   setState(() {
                                    //     if (value.isEmpty) {
                                    //       _quantityTextController.text = '1';
                                    //     } else {
                                    //       return;
                                    //     }
                                    //   });
                                    // },
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        _quantityTextController.text = '1';
                                        _quantityTextController.selection =
                                            TextSelection.fromPosition(
                                              const TextPosition(offset: 1),
                                            );
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              QuantityController(
                                padding: 5,
                                // onTap: () {
                                //   // cartProvider.increaseQuantityByOne(
                                //   //     cartModel.productId);
                                //   setState(() {
                                //     _quantityTextController.text = (
                                //       int.parse(_quantityTextController.text) +
                                //           1,
                                //     ).toString();
                                //   });
                                // },// للزيادة
                                onTap: () {
                                  int currentQuantity =
                                      int.tryParse(
                                        _quantityTextController.text,
                                      ) ??
                                      1;
                                  currentQuantity++;
                                  _quantityTextController.text = currentQuantity
                                      .toString();
                                  setState(() {});
                                },

                                color: Colors.green,
                                icon: CupertinoIcons.plus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              // await cartProvider.removeOneItem(
                              //   cartId: cartModel.id,
                              //   productId: cartModel.productId,
                              //   quantity: cartModel.quantity,
                              // );
                            },
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          HeartBTN(
                            productId: "getCurrProduct.id",
                            isInWishlist: true,
                          ),
                          CustomText(
                            // text:
                            //     '\$${(usedPrice * int.parse(_quantityTextController.text)).toStringAsFixed(2)}',
                            text: r"$ 21",
                            fontSize: 18,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
