// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/cubits/products_cubit/products_cubit.dart';
// import '../../../../../core/utils/utils.dart';
// import 'product_item.dart';

// class ProductsGridView extends StatefulWidget {
//   const ProductsGridView({super.key});

//   @override
//   State<ProductsGridView> createState() => _ProductsGridViewState();
// }

// class _ProductsGridViewState extends State<ProductsGridView> {
//   StreamSubscription? _productsSubscription;

//   @override
//   void initState() {
//     super.initState();

//     context.read<ProductsCubit>().getProducts();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (category != null && category.isNotEmpty) {
//         final cubit = context.read<ProductsCubit>();

//         if (cubit.state is ProductsSuccess) {
//           cubit.filterByCategory(categoryName: category);
//         } else {
//           _productsSubscription = cubit.stream.listen((state) {
//             if (state is ProductsSuccess) {
//               cubit.filterByCategory(categoryName: category);
//               _productsSubscription?.cancel();
//               _productsSubscription = null;
//             }
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _productsSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Utils utils = Utils(context);
//     Size size = utils.getScreenSize;

//     return SliverGrid(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) => const ProductItem(),
//         childCount: 4,
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,

//         crossAxisSpacing: 10,

//         mainAxisSpacing: 10,

//         childAspectRatio: size.width / (size.height * 0.55),
//         //  childAspectRatio: 0.65, // مهم جدًا لمنع Overflow
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/utils.dart';
import 'product_item.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    super.initState();
    // تحميل المنتجات عند فتح الصفحة
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text("Error: ${state.errMessage}")),
          );
        } else if (state is ProductsSuccess) {
          //  final products = state.products;
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(
                //product: products[index]
              ),
              childCount: 4,
              // childCount: products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.55),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
