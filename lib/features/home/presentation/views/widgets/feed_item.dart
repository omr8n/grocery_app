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
// import 'package:grocery_app/models/products_model.dart';
// import 'package:grocery_app/providers/cart_provider.dart';
// import 'package:grocery_app/widgets/price_widget.dart';
// import 'package:grocery_app/widgets/text_widget.dart';
// import 'package:provider/provider.dart';

// import '../consts/firebase_consts.dart';
// import '../inner_screens/on_sale_screen.dart';
// import '../inner_screens/product_details.dart';
// import '../providers/wishlist_provider.dart';
// import '../services/global_methods.dart';

// import 'heart_btn.dart';

class FeedsItem extends StatefulWidget {
  const FeedsItem({super.key});

  @override
  State<FeedsItem> createState() => _FeedsItemState();
}

class _FeedsItemState extends State<FeedsItem> {
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
                ctx: context, routeName: ProductDetailsView.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(children: [
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
                  )),
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
                        isOnSale: false,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 5,
                          child: CustomText(
                            text: '1KG',
                            fontSize: 20,
                            isTitle: true,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // Flexible(
                        //     flex: 3,
                        //     // TextField can be used also instead of the textFormField
                        //     child: TextFormField(
                        //       controller: _quantityTextController,
                        //       key: const ValueKey('10'),
                        //       decoration: InputDecoration(
                        //         border: OutlineInputBorder(
                        //             borderSide: BorderSide(width: 0)),
                        //       ),
                        //       style: TextStyle(fontSize: 18),
                        //       keyboardType: TextInputType.number,
                        //       maxLines: 1,
                        //       enabled: true,
                        //       onChanged: (value) {
                        //         setState(() {});
                        //       },
                        //       inputFormatters: [
                        //         FilteringTextInputFormatter.allow(
                        //           RegExp('[0-9.]'),
                        //         ),
                        //       ],
                        //     ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 5,
            )),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                // onPressed: _isInCart
                //     ? null
                //     : () async {
                //         // if (_isInCart) {
                //         //   return;
                //         // }
                //         final User? user = authInstance.currentUser;

                //         if (user == null) {
                //           GlobalMethods.errorDialog(
                //               subtitle: 'No user found, Please login first',
                //               context: context);
                //           return;
                //         }
                //         await GlobalMethods.addToCart(
                //             productId: productModel.id,
                //             quantity: int.parse(_quantityTextController.text),
                //             context: context);
                //         await cartProvider.fetchCart();
                //         // cartProvider.addProductsToCart(
                //         //     productId: productModel.id,
                //         //     quantity: int.parse(_quantityTextController.text));
                //       },
                child: CustomText(
                  //  text: _isInCart ? 'In cart' : 'Add to cart',
                  text: "Add to cart",
                  maxLines: 1,
                  // color: color,//

                  fontSize: 20,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    )),
                onPressed: () {},
              ),
            )
          ]),
        ),
      ),
    );
  }
}
