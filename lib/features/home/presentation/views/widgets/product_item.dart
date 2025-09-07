import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/price_item.dart';
import 'package:grocery_app/features/inner_screens/product_details_view.dart';

import '../../../../../core/helper/functions/global_methods.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/heart_btn.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late final TextEditingController _quantityTextController;
  @override
  void initState() {
    _quantityTextController = TextEditingController(text: "1");
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    // final productModel = Provider.of<ProductModel>(context);
    // final cartProvider = Provider.of<CartProvider>(context);
    // bool? _isInCart = cartProvider.getCartItems.containsKey(productModel.id);
    //  final wishlistProvider = Provider.of<WishlistProvider>(context);
    //  bool? _isInWishlist =
    //      wishlistProvider.getWishlistItems.containsKey(productModel.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, ProductDetails.routeName,
            //     arguments: productModel.id);
            GlobalMethods.navigateTo(
              ctx: context,
              routeName: ProductDetailsView.routeName,
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                //   imageUrl: productModel.imageUrl,
                imageUrl: AppConstants.productImageUrl,
                height: size.width * 0.21,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: CustomText(
                        // text: productModel.title,
                        text: "shose",

                        //   color: color,
                        maxLines: 1,
                        fontSize: 18,
                        isTitle: true,
                      ),
                    ),
                    Flexible(
                      child: HeartBTN(
                        productId: "productModel",
                        isInWishlist: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: FittedBox(
                        child: PriceItem(
                          salePrice: 4,
                          price: 6,
                          textPrice: _quantityTextController.text,
                          isOnSale: true,
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(text: '1KG', fontSize: 20, isTitle: true),
                          const SizedBox(width: 5),
                          Container(
                            color: Theme.of(context).cardColor,
                            width: 50,

                            child: Center(
                              child: TextFormField(
                                controller: _quantityTextController,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 4,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(fontSize: 16),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // زر Add to cart
              SizedBox(
                height: 45,
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).cardColor,
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
