import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/core/widgets/add_to_button_details.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/widgets/back_widget.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/core/widgets/heart_btn.dart';
// import 'package:grocery_app/core/widgets/heart_btn.dart';
import 'package:grocery_app/core/widgets/quantity_controller.dart';

// import 'package:provider/provider.dart';

import '../../core/utils/utils.dart';
// import '../../core/widgets/heart_btn.dart';

class ProductDetailsView extends StatefulWidget {
  static const routeName = '/ProductDetails';

  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final _quantityTextController = TextEditingController(text: '1');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {},
      // onWillPop: () async {
      //   // viewedProdProvider.addProductToHistory(productId: productId);
      //   return true;
      // },
      child: Scaffold(
        appBar: AppBar(
          leading: BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: FancyShimmerImage(
                imageUrl: widget.productEntity.imageUrl!,
                // imageUrl:
                //     "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
                boxFit: BoxFit.scaleDown,
                width: size.width,
                // height: screenHeight * .4,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomText(
                              //  text: getCurrProduct.title,
                              ////  text: "title",
                              text: widget.productEntity.name,
                              fontSize: 25,
                              isTitle: true,
                            ),
                          ),
                          HeartBottonWidget(
                            size: 20,
                            product: widget.productEntity,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text:
                                '\$${widget.productEntity.price.toStringAsFixed(2)}',

                            // text: '\$${324}',
                            color: Colors.green,
                            fontSize: 22,
                            isTitle: true,
                          ),
                          CustomText(
                            text: widget.productEntity.isPiece
                                ? '/Piece'
                                : '/Kg',

                            // text: ' 34/Piece',
                            fontSize: 12,
                            isTitle: false,
                          ),
                          const SizedBox(width: 10),
                          Visibility(
                            visible: widget.productEntity.isOnSale
                                ? true
                                : false,
                            // visible: getCurrProduct.isOnSale ? true : false,
                            //  visible: true,
                            child: Text(
                              '\$${widget.productEntity.price.toStringAsFixed(2)}',
                              // '\$2',
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Material(
                            color: const Color.fromRGBO(63, 200, 101, 1),
                            borderRadius: BorderRadius.circular(5),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),

                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {},
                                child: CustomText(
                                  text: 'Free delivery',
                                  color: Colors.white,
                                  fontSize: 20,
                                  isTitle: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuantityController(
                          onTap: () {
                            if (_quantityTextController.text == '1') {
                              return;
                            } else {
                              setState(() {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) -
                                            1)
                                        .toString();
                              });
                            }
                          },
                          icon: CupertinoIcons.minus,
                          color: Colors.red,
                          padding: 8,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _quantityTextController,
                            key: const ValueKey('quantity'),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,
                            enabled: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  _quantityTextController.text = '1';
                                } else {}
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        QuantityController(
                          onTap: () {
                            setState(() {
                              _quantityTextController.text =
                                  (int.parse(_quantityTextController.text) + 1)
                                      .toString();
                            });
                          },
                          icon: CupertinoIcons.plus,
                          color: Colors.green,
                          padding: 8,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,

                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Total',
                                  color: Colors.red.shade300,
                                  fontSize: 20,
                                  isTitle: true,
                                ),
                                const SizedBox(height: 5),
                                FittedBox(
                                  child: Row(
                                    children: [
                                      CustomText(
                                        // text:
                                        //     '\$${totalPrice.toStringAsFixed(2)}/',
                                        text: '\$243',

                                        fontSize: 20,
                                        isTitle: true,
                                      ),
                                      CustomText(
                                        text:
                                            '${_quantityTextController.text}Kg',

                                        // text: r"$1Kg",
                                        fontSize: 16,
                                        isTitle: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: AddCartButtonDetails(
                              productEntity: widget.productEntity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
