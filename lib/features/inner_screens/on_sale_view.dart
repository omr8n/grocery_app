import 'package:flutter/material.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/back_widget.dart';
import '../../core/widgets/empty_products_widget.dart';
import '../home/presentation/views/widgets/on_sale_Item.dart';

class OnSaleView extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleView({super.key});
  @override
  Widget build(BuildContext context) {
    // final productProviders = Provider.of<ProductsProvider>(context);
    //  List<ProductModel> productsOnSale = productProviders.getOnSaleProducts;
    // final Color color = Utils(context).color;\
    //  bool _isEmbty = true;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CustomText(
          text: 'Products on sale',
          fontSize: 24.0,
          isTitle: true,
        ),
      ),
      body:
          // _isEmbty
          //     ?
          // const EmptyProdWidget(
          //     text: 'No products on sale yet!,\nStay tuned',
          //   )
          // :
          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            // crossAxisSpacing: 10,
            childAspectRatio: size.width / (size.height * 0.45),
            children: List.generate(16, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OnSaleItem(),
              );
            }),
            // children: List.generate(productsOnSale.length, (index) {
            //   return ChangeNotifierProvider.value(
            //     value: productsOnSale[index],
            //     child: const OnSaleItem(),
            //   );
            // }),
          ),
    );
  }
}
