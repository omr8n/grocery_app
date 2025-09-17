// import 'package:flutter/material.dart';

// import '../../../../../core/constants/app_constants.dart';
// import '../../../../../core/utils/utils.dart';
// import 'product_item.dart';

// class ProductGridView extends StatelessWidget {
//   const ProductGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;
//     return SliverGrid(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) => ProductItem(
//           //product: products[index]
//         ),
//         childCount: AppConstants.productsList.length < 10
//             ? AppConstants.productsList.length
//             : 10,
//         // childCount: products.length,
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         childAspectRatio: size.width / (size.height * 0.55),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:grocery_app/core/entites/product_entity.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/utils/utils.dart';
import 'product_item.dart';

class ProductGridView extends StatelessWidget {
  final bool showAll; // إذا true يعرض الكل، إذا false يعرض 4 بس

  const ProductGridView({
    super.key,
    this.showAll = false,
    required this.child,
    // required this.products,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;

    //  final products = AppConstants.productsList;

    // إذا ما بدنا الكل => بس أول 4 عناصر

    return child;
  }
}
