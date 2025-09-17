// // import 'package:flutter/material.dart';

// // import '../../../core/utils/utils.dart';
// // import '../../home/presentation/views/widgets/product_item.dart';

// // class ProductViewBody extends StatefulWidget {
// //   const ProductViewBody({super.key});

// //   @override
// //   State<ProductViewBody> createState() => _ProductViewBodyState();
// // }

// // class _ProductViewBodyState extends State<ProductViewBody> {
// //   final TextEditingController? searchTextController = TextEditingController();
// //   final FocusNode _searchTextFocusNode = FocusNode();
// //   @override
// //   void dispose() {
// //     searchTextController!.dispose();
// //     _searchTextFocusNode.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   void initState() {
// //     // final productsProvider =
// //     //     Provider.of<ProductsProvider>(context, listen: false);
// //     // productsProvider.fetchProducts();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = Utils(context).getScreenSize;
// //     return SingleChildScrollView(
// //       child: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: SizedBox(
// //               height: kBottomNavigationBarHeight,
// //               child: TextField(
// //                 focusNode: _searchTextFocusNode,
// //                 controller: searchTextController,
// //                 onChanged: (valuee) {
// //                   setState(() {
// //                     //    listProdcutSearch = productsProvider.searchQuery(valuee);
// //                   });
// //                 },
// //                 decoration: InputDecoration(
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: const BorderSide(
// //                       color: Colors.greenAccent,
// //                       width: 1,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: const BorderSide(
// //                       color: Colors.greenAccent,
// //                       width: 1,
// //                     ),
// //                   ),
// //                   hintText: "What's in your mind",
// //                   prefixIcon: const Icon(Icons.search),
// //                   suffix: IconButton(
// //                     onPressed: () {
// //                       searchTextController!.clear();
// //                       _searchTextFocusNode.unfocus();
// //                     },
// //                     icon: Icon(
// //                       Icons.close,
// //                       color: _searchTextFocusNode.hasFocus
// //                           ? Colors.red
// //                           : Colors.green,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           // _searchTextController!.text.isNotEmpty && listProdcutSearch.isEmpty
// //           // isEmbty
// //           //     ? const EmptyProdWidget(
// //           //         text: 'No products found, please try another keyword',
// //           //       )
// //           //     :
// //           GridView.count(
// //             shrinkWrap: true,
// //             physics: const NeverScrollableScrollPhysics(),
// //             crossAxisCount: 2,
// //             padding: EdgeInsets.zero,
// //             // crossAxisSpacing: 10,
// //             childAspectRatio: size.width / (size.height * 0.58),
// //             children: List.generate(
// //               // _searchTextController!.text.isNotEmpty
// //               //     ? listProdcutSearch.length
// //               //     : allProducts.length, (index) {
// //               //  return ChangeNotifierProvider.value(
// //               // value: _searchTextController!.text.isNotEmpty
// //               //     ? listProdcutSearch[index]
// //               //     : allProducts[index],
// //               // child: const FeedsWidget(),
// //               //   );
// //               23,
// //               (index) {
// //                 return ProductItem();
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/products_grid_view_builder.dart';

// import '../../../core/cubits/products_cubit/products_cubit.dart';
// import '../../../core/utils/utils.dart';

// class ProductViewBody extends StatefulWidget {
//   const ProductViewBody({super.key, this.passedCategory});
//   final String? passedCategory;
//   @override
//   State<ProductViewBody> createState() => _ProductViewBodyState();
// }

// class _ProductViewBodyState extends State<ProductViewBody> {
//   final TextEditingController? searchTextController = TextEditingController();
//   final FocusNode _searchTextFocusNode = FocusNode();
//   late TextEditingController searchController;
//   StreamSubscription? _productsSubscription;

//   @override
//   void initState() {
//     super.initState();

//     searchController = TextEditingController();

//     context.read<ProductsCubit>().getProducts();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final category = widget.passedCategory;
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
//     searchTextController!.dispose();
//     _searchTextFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;

//     return CustomScrollView(
//       slivers: [
//         /// مربع البحث
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: kBottomNavigationBarHeight,
//               child: TextField(
//                 focusNode: _searchTextFocusNode,
//                 controller: searchTextController,
//                 onChanged: (valuee) {
//                   setState(() {
//                     // listProdcutSearch = productsProvider.searchQuery(valuee);
//                   });
//                 },
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Colors.greenAccent,
//                       width: 1,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Colors.greenAccent,
//                       width: 1,
//                     ),
//                   ),
//                   hintText: "What's in your mind",
//                   prefixIcon: const Icon(Icons.search),
//                   suffix: IconButton(
//                     onPressed: () {
//                       searchTextController!.clear();
//                       _searchTextFocusNode.unfocus();
//                     },
//                     icon: Icon(
//                       Icons.close,
//                       color: _searchTextFocusNode.hasFocus
//                           ? Colors.red
//                           : Colors.green,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: BlocBuilder<ProductsCubit, ProductsState>(
//             builder: (context, state) {
//               if (searchController.text.isNotEmpty &&
//                   state is ProductsSuccess &&
//                   state.products.isEmpty) {
//                 return const Center(
//                   child: CustomText(text: "No results found", fontSize: 40),
//                 );
//               }
//               return ProductGridViewBlocBuilder(
//                 // searchController: searchController,
//               );
//             },
//           ),
//         ),

//         /// شبكة المنتجات
//       ],
//     );
//   }
// }

/// شبكة المنتجات أو رسالة لا توجد منتجات
// BlocBuilder<ProductsCubit, ProductsState>(
//   builder: (context, state) {
//     if (state is ProductsLoading) {
//       // عرض شبكة Skeleton أثناء التحميل
//       return SliverPadding(
//         padding: const EdgeInsets.all(8),
//         sliver: SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) =>
//                 const Card(child: SizedBox(height: 150)),
//             childCount: 6,
//           ),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 0.7,
//           ),
//         ),
//       );
//     } else if (state is ProductsSuccess) {
//       final validProducts = state.products
//           .where(
//             (product) =>
//                 product.imageUrl != null &&
//                 product.productId.isNotEmpty,
//           )
//           .toList();

//       // if (validProducts.isEmpty) {
//       //   return const SliverFillRemaining(
//       //     hasScrollBody: false,
//       //     child: Center(
//       //       child: CustomText(text: 'No products found', fontSize: 18),
//       //     ),
//       //   );
//       // }

//       // عرض شبكة المنتجات
//       return ProductGridViewBlocBuilder();
//     } else {
//       return const SliverFillRemaining(
//         hasScrollBody: false,
//         child: Center(
//           child: CustomText(text: 'No products found', fontSize: 18),
//         ),
//       );
//     }
//   },
// ),

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../core/cubits/products_cubit/products_cubit.dart';

import '../../home/presentation/views/widgets/products_grid_view_builder.dart';
// import 'widgets/products_grid_view_builder.dart';

// class ProductViewBody extends StatefulWidget {
//   const ProductViewBody({super.key, this.passedCategory});
//   final String? passedCategory;

//   @override
//   State<ProductViewBody> createState() => _ProductViewBodyState();
// }

// class _ProductViewBodyState extends State<ProductViewBody> {
//   final TextEditingController searchTextController = TextEditingController();
//   final FocusNode _searchTextFocusNode = FocusNode();
//   StreamSubscription? _productsSubscription;

//   @override
//   void initState() {
//     super.initState();

//     // جلب المنتجات
//     context.read<ProductsCubit>().getProducts();

//     // فلترة حسب الفئة إذا تم تمريرها
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final category = widget.passedCategory;
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
//     searchTextController.dispose();
//     _searchTextFocusNode.dispose();
//     _productsSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         // مربع البحث
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: kBottomNavigationBarHeight,
//               child: TextField(
//                 controller: searchTextController,
//                 focusNode: _searchTextFocusNode,
//                 onChanged: (value) {
//                   if (value.isNotEmpty) {
//                     context.read<ProductsCubit>().searchProducts(
//                       searchText: value,
//                       productsList: context.read<ProductsCubit>().allProducts,
//                     );
//                   } else {
//                     final category = widget.passedCategory;
//                     if (category != null && category.isNotEmpty) {
//                       context.read<ProductsCubit>().filterByCategory(
//                         categoryName: category,
//                       );
//                     } else {
//                       context.read<ProductsCubit>().resetProducts();
//                     }
//                   }
//                 },
//                 decoration: InputDecoration(
//                   hintText: "What's in your mind?",
//                   prefixIcon: const Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         // المنتجات (حسب الفئة)
//         ProductGridViewBlocBuilder(
//           showAll: true,
//           useFiltered: true, // 👈 مهم
//         ),
//       ],
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   //    Size size = Utils(context).getScreenSize;

//   //   return CustomScrollView(
//   //     slivers: [
//   //       /// مربع البحث
//   //       SliverToBoxAdapter(
//   //         child: Padding(
//   //           padding: const EdgeInsets.all(8.0),
//   //           child: SizedBox(
//   //             height: kBottomNavigationBarHeight,
//   //             child: TextField(
//   //               focusNode: _searchTextFocusNode,
//   //               controller: searchTextController,
//   //               onChanged: (value) {
//   //                 setState(() {});
//   //               },
//   //               decoration: InputDecoration(
//   //                 focusedBorder: OutlineInputBorder(
//   //                   borderRadius: BorderRadius.circular(12),
//   //                   borderSide: const BorderSide(
//   //                     color: Colors.greenAccent,
//   //                     width: 1,
//   //                   ),
//   //                 ),
//   //                 enabledBorder: OutlineInputBorder(
//   //                   borderRadius: BorderRadius.circular(12),
//   //                   borderSide: const BorderSide(
//   //                     color: Colors.greenAccent,
//   //                     width: 1,
//   //                   ),
//   //                 ),
//   //                 hintText: "What's in your mind",
//   //                 prefixIcon: const Icon(Icons.search),
//   //                 suffix: IconButton(
//   //                   onPressed: () {
//   //                     searchTextController.clear();
//   //                     _searchTextFocusNode.unfocus();
//   //                     setState(() {});
//   //                   },
//   //                   icon: Icon(
//   //                     Icons.close,
//   //                     color: _searchTextFocusNode.hasFocus
//   //                         ? Colors.red
//   //                         : Colors.green,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //       ProductGridViewBlocBuilder(showAll: true),
//   //     ],
//   //   );
//   // }
// }
class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, this.passedCategory});
  final String? passedCategory;

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  StreamSubscription? _productsSubscription;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<ProductsCubit>();
    cubit.getProducts();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final category = widget.passedCategory;
      if (category != null && category.isNotEmpty) {
        if (!mounted) return;

        if (cubit.state is ProductsSuccess) {
          cubit.filterByCategory(categoryName: category);
        } else {
          _productsSubscription = cubit.stream.listen((state) {
            if (!mounted) return;

            if (state is ProductsSuccess) {
              cubit.filterByCategory(categoryName: category);
              _productsSubscription?.cancel();
              _productsSubscription = null;
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    _searchTextFocusNode.dispose();
    _productsSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // مربع البحث
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: TextField(
                controller: searchTextController,
                focusNode: _searchTextFocusNode,
                onChanged: (value) {
                  final cubit = context.read<ProductsCubit>();
                  final category = widget.passedCategory;

                  if (value.isNotEmpty) {
                    cubit.searchProducts(
                      searchText: value,
                      productsList: cubit.allProducts,
                    );
                  } else {
                    if (category != null && category.isNotEmpty) {
                      cubit.filterByCategory(categoryName: category);
                    } else {
                      cubit.resetProducts();
                    }
                  }
                },
                decoration: const InputDecoration(
                  hintText: "What's in your mind?",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),

        // المنتجات (حسب الفئة)
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final cubit = context.read<ProductsCubit>();
            final category = widget.passedCategory;
            final products = (category != null && category.isNotEmpty)
                ? cubit.filteredProducts
                : cubit.allProducts;

            if (products.isEmpty && category != null && category.isNotEmpty) {
              return SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Icon(Icons.warning, size: 80, color: Colors.grey),
                    const SizedBox(height: 10),
                    Text(
                      "No products found in this category",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            }

            if (products.isEmpty) {
              return const SliverToBoxAdapter(); // Home empty
            }

            return ProductGridViewBlocBuilder(
              showAll: true,
              useFiltered: category != null && category.isNotEmpty,
            );
          },
        ),
      ],
    );
  }
}
