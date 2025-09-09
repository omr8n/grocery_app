import 'package:flutter/material.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import 'package:grocery_app/features/inner_screens/widgets/product_view_body.dart';

import '../../core/widgets/back_widget.dart';

class ProductsView extends StatelessWidget {
  static const routeName = "/FeedsScreenState";
  const ProductsView({super.key, this.passedCategory});
  final String? passedCategory;
  //List<ProductModel> listProdcutSearch = [];
  @override
  Widget build(BuildContext context) {
    // bool isEmbty = false;

    //final productsProvider = Provider.of<ProductsProvider>(context);
    // List<ProductModel> allProducts = productsProvider.getProducts;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: CustomText(
          text: passedCategory ?? "All Products",
          fontSize: 20.0,
          isTitle: true,
        ),
      ),
      body: ProductViewBody(),
    );
  }
}
