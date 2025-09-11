import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/utils/utils.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_item.dart';

class OnSaleListView extends StatelessWidget {
  const OnSaleListView({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final products = AppConstants.productsList;
    // final themeState = utils.getTheme;
    // final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    return SizedBox(
      height: size.height * 0.22,
      child: ListView.builder(
        // itemCount: productsOnSale.length < 10
        //     ? productsOnSale.length
        //     : 10,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          //   return Text("fewfwef");
          return OnSaleItem(
            productEntity: products[index],
            // productEntity: ,
          );
          // return ChangeNotifierProvider.value(
          //     value: productsOnSale[index],
          //     child: const OnSaleWidget());
        },
      ),
    );
  }
}
