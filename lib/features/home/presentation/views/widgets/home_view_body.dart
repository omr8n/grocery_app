// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';

// import '../../../../../core/utils/utils.dart';
// import 'custom_swiper.dart';
// import 'feed_item.dart';
// import 'feeds_section.dart';
// import 'on_sale_section.dart';

// class HomeViewBody extends StatelessWidget {
//   const HomeViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Utils utils = Utils(context);
//     Size size = utils.getScreenSize;
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Column(
//             children: [
//               CustomSwiper(),
//               const SizedBox(height: 6),
//               OnSaleSection(),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               FeedsSection(),

//               // GridView.count(
//               //   shrinkWrap: true,
//               //   physics: const NeverScrollableScrollPhysics(),
//               //   crossAxisCount: 2,
//               //   padding: EdgeInsets.zero,
//               //   // crossAxisSpacing: 10,
//               //   childAspectRatio: size.width / (size.height * 0.50),
//               //   children: List.generate(4, (index) {
//               //     return FeedsItem();
//               //   }),
//               //   // children: List.generate(
//               //   //     allProducts.length < 4
//               //   //         ? allProducts.length // length 3
//               //   //         : 4, (index) {
//               //   //   return ChangeNotifierProvider.value(
//               //   //     value: allProducts[index],
//               //   //     child: const Feedsitem(),
//               //   //   );
//               //   // }),
//               // ),
//               // GridView.count(
//               //   shrinkWrap: true,
//               //   physics: const NeverScrollableScrollPhysics(),
//               //   crossAxisCount: 2,
//               //   padding: EdgeInsets.zero,
//               //   // crossAxisSpacing: 10,
//               //   childAspectRatio: size.width / (size.height * 0.61),
//               //   children: List.generate(
//               //       allProducts.length < 4
//               //           ? allProducts.length // length 3
//               //           : 4, (index) {
//               //     return ChangeNotifierProvider.value(
//               //       value: allProducts[index],
//               //       child: const FeedsWidget(),
//               //     );
//               //   }),
//               // )
//             ],
//           ),
//         ),

//         SliverGrid(
//           delegate: SliverChildBuilderDelegate((context, index) {
//             return FeedsItem();
//             // final CategoryModel category = AppConstants.categoriesList[index];
//             // return CategoryItem(category: category);
//           }, childCount: 4),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'custom_swiper.dart';

import 'feeds_section.dart';
import 'on_sale_section.dart';
import 'products_grid_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: const [
              CustomSwiper(),
              SizedBox(height: 6),
              OnSaleSection(),
              FeedsSection(),
            ],
          ),
        ),

        /// Grid المنتجات
        // ProductGridViewBlocBuilder(),
        ProductGridViewBlocBuilder(
          showAll: false,
          useFiltered: false, // 👈 يعرض كل المنتجات
        ),
      ],
    );
  }
}
