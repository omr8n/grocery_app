// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // import '../../../../../core/cubits/products_cubit/products_cubit.dart';
// // import '../../../../../core/utils/utils.dart';
// // import 'product_item.dart';

// // class ProductsGridView extends StatefulWidget {
// //   const ProductsGridView({super.key});

// //   @override
// //   State<ProductsGridView> createState() => _ProductsGridViewState();
// // }

// // class _ProductsGridViewState extends State<ProductsGridView> {
// //   StreamSubscription? _productsSubscription;

// //   @override
// //   void initState() {
// //     super.initState();

// //     context.read<ProductsCubit>().getProducts();

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       if (category != null && category.isNotEmpty) {
// //         final cubit = context.read<ProductsCubit>();

// //         if (cubit.state is ProductsSuccess) {
// //           cubit.filterByCategory(categoryName: category);
// //         } else {
// //           _productsSubscription = cubit.stream.listen((state) {
// //             if (state is ProductsSuccess) {
// //               cubit.filterByCategory(categoryName: category);
// //               _productsSubscription?.cancel();
// //               _productsSubscription = null;
// //             }
// //           });
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _productsSubscription?.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final Utils utils = Utils(context);
// //     Size size = utils.getScreenSize;

// //     return SliverGrid(
// //       delegate: SliverChildBuilderDelegate(
// //         (context, index) => const ProductItem(),
// //         childCount: 4,
// //       ),
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: 2,

// //         crossAxisSpacing: 10,

// //         mainAxisSpacing: 10,

// //         childAspectRatio: size.width / (size.height * 0.55),
// //         //  childAspectRatio: 0.65, // مهم جدًا لمنع Overflow
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:skeletonizer/skeletonizer.dart';

// import '../../../../../core/cubits/products_cubit/products_cubit.dart';
// import 'product_grid_view.dart';

// class ProductGridViewBlocBuilder extends StatelessWidget {
//   const ProductGridViewBlocBuilder({
//     super.key,
//     //  this.searchController
//   });

//   // final TextEditingController? searchController;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductsCubit, ProductsState>(
//       listener: (context, state) {
//         // if (state is ProductsFailure) {
//         //   MyAppMethods.showErrorORWarningDialog(
//         //     context: context,
//         //     subtitle: state.errMessage,
//         //     fct: () {},
//         //   );
//         // }
//       },
//       builder: (context, state) {
//         if (state is ProductsLoading) {
//           return SliverSkeletonizer(
//             child: SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => const Card(child: SizedBox(height: 150)),
//                 childCount: 6,
//               ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 0.7,
//               ),
//             ),
//           );
//         } else if (state is ProductsSuccess) {
//           final validProducts = state.products
//               .where(
//                 (product) =>
//                     product.imageUrl != null && product.productId.isNotEmpty,
//               )
//               .toList();

//           if (validProducts.isEmpty) {
//             return const Center(child: Text('No products found'));
//           }
//           return ProductGridView();
//           // return ProductGridView(
//           //   // searchController: searchController,
//           //   // products: validProducts,
//           // );
//         } else {
//           return const Center(child: Text('No products found'));
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import 'product_grid_view.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({super.key, this.showAll = false});
  final bool showAll;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        // حالة التحميل
        if (state is ProductsLoading) {
          return SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const Card(child: SizedBox(height: 150)),
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
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
          return ProductGridView(showAll: showAll);
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
