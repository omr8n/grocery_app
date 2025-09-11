import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/constants/app_constants.dart';
import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:grocery_app/core/utils/utils.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_item.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';

class OnSaleListViewBuilder extends StatelessWidget {
  const OnSaleListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // final products = AppConstants.productsList;
    // final themeState = utils.getTheme;
    // final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        // حالة التحميل
        if (state is ProductsLoading) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                // itemCount: productsOnSale.length < 10
                //     ? productsOnSale.length
                //     : 10,
                // itemCount: 10,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Card();
                  // return ChangeNotifierProvider.value(
                  //     value: productsOnSale[index],
                  //     child: const OnSaleWidget());
                },
              ),
            ),
          );
        }
        // حالة نجاح تحميل المنتجات
        else if (state is ProductsSuccess) {
          // final validProducts = state.products
          //     .where(
          //       (product) =>
          //           product.imageUrl != null && product.productId.isNotEmpty,
          //     )
          //     .toList();

          // if (validProducts.isEmpty) {
          //   return const SliverToBoxAdapter(
          //     child: Center(
          //       child: Padding(
          //         padding: EdgeInsets.all(20.0),
          //         child: Text(
          //           'No products found',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //       ),
          //     ),
          //   );
          // }

          // عرض الشبكة باستخدام SliverGrid
          return OnSaleListView();
        }
        // أي حالة أخرى
        else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'No products found',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// // import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_item.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';

// class OnSaleListViewBuilder extends StatelessWidget {
//   const OnSaleListViewBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductsCubit, ProductsState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         // حالة التحميل
//         if (state is ProductsLoading) {
//           return SliverToBoxAdapter(
//             child: SizedBox(
//               height: 180,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 6, // Placeholder
//                 itemBuilder: (ctx, index) =>
//                     const Card(child: SizedBox(width: 140, height: 160)),
//               ),
//             ),
//           );
//         }
//         // حالة نجاح تحميل المنتجات
//         else if (state is ProductsSuccess) {
//           final products = state.products;

//           if (products.isEmpty) {
//             return const SliverToBoxAdapter(
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Text(
//                     'No products found',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             );
//           }

//           return SliverToBoxAdapter(child: OnSaleListView());
//         }
//         // أي حالة أخرى
//         else {
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text(
//                   'No products found',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
