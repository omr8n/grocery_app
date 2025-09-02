import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/feed_item.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/feeds_section.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_section.dart';
import 'package:grocery_app/features/inner_screens/feeds_screen.dart';
import 'package:grocery_app/features/inner_screens/on_sale_view.dart';

import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants.dart';

import '../../../../core/helper/functions/global_methods.dart';
import '../../../../core/utils/utils.dart';
import 'widgets/custom_swiper.dart';
import 'widgets/on_sale_item.dart';
import '../../../../core/widgets/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // final themeState = utils.getTheme;
    // final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    // final productProviders = Provider.of<ProductsProvider>(context);
    //  List<ProductModel> allProducts = productProviders.getProducts;
    //   List<ProductModel> productsOnSale = productProviders.getOnSaleProducts;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSwiper(),
            const SizedBox(
              height: 6,
            ),
            OnSaleSection(),
            // const SizedBox(
            //   height: 10,
            // ),
            FeedsSection(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.61),
              children: List.generate(4, (index) {
                return FeedsItem();
              }),
              // children: List.generate(
              //     allProducts.length < 4
              //         ? allProducts.length // length 3
              //         : 4, (index) {
              //   return ChangeNotifierProvider.value(
              //     value: allProducts[index],
              //     child: const Feedsitem(),
              //   );
              // }),
            )
            // GridView.count(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   crossAxisCount: 2,
            //   padding: EdgeInsets.zero,
            //   // crossAxisSpacing: 10,
            //   childAspectRatio: size.width / (size.height * 0.61),
            //   children: List.generate(
            //       allProducts.length < 4
            //           ? allProducts.length // length 3
            //           : 4, (index) {
            //     return ChangeNotifierProvider.value(
            //       value: allProducts[index],
            //       child: const FeedsWidget(),
            //     );
            //   }),
            // )
          ],
        ),
      ),
    );
  }
}
