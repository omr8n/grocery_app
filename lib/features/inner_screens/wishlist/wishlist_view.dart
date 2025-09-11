// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:flutter_iconly/flutter_iconly.dart';

// // // // // // // // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // // // // // // // import 'package:grocery_app/core/widgets/custom_text.dart';

// // // // // // // // import '../../../core/helper/functions/global_methods.dart';
// // // // // // // // import '../../../core/utils/utils.dart';
// // // // // // // // import '../../../core/widgets/back_widget.dart';
// // // // // // // // import '../../../core/widgets/empty_screen.dart';
// // // // // // // // import 'wishlist_widget.dart';

// // // // // // // // class WishlistView extends StatelessWidget {
// // // // // // // //   static const routeName = "/WishlistScreen";
// // // // // // // //   const WishlistView({super.key});

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     //  final Color color = Utils(context).color;
// // // // // // // //     Size size = Utils(context).getScreenSize;
// // // // // // // //     bool isEmbty = false;
// // // // // // // //     // final wishlistProvider = Provider.of<WishlistProvider>(context);
// // // // // // // //     // final wishlistItemsList =
// // // // // // // //     //     wishlistProvider.getWishlistItems.values.toList().reversed.toList();
// // // // // // // //     return isEmbty
// // // // // // // //         ? const EmptyScreen(
// // // // // // // //             title: 'Your Wishlist Is Empty',
// // // // // // // //             subtitle: 'Explore more and shortlist some items',
// // // // // // // //             imagePath: 'assets/images/wishlist.png',
// // // // // // // //             buttonText: 'Add a wish',
// // // // // // // //           )
// // // // // // // //         : Scaffold(
// // // // // // // //             appBar: AppBar(
// // // // // // // //               centerTitle: true,
// // // // // // // //               leading: const BackWidget(),
// // // // // // // //               automaticallyImplyLeading: false,
// // // // // // // //               elevation: 0,
// // // // // // // //               backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// // // // // // // //               title: CustomText(
// // // // // // // //                 // text: 'Wishlist (${wishlistItemsList.length})',
// // // // // // // //                 text: "Wishlist 23",
// // // // // // // //                 // color: color,
// // // // // // // //                 isTitle: true,
// // // // // // // //                 fontSize: 22,
// // // // // // // //               ),
// // // // // // // //               actions: [
// // // // // // // //                 IconButton(
// // // // // // // //                   onPressed: () {
// // // // // // // //                     GlobalMethods.warningDialog(
// // // // // // // //                       title: 'Empty your wishlist?',
// // // // // // // //                       subtitle: 'Are you sure?',
// // // // // // // //                       fct: () async {
// // // // // // // //                         // await wishlistProvider.clearOnlineWishlist();
// // // // // // // //                         // wishlistProvider.clearLocalWishlist();
// // // // // // // //                       },
// // // // // // // //                       context: context,
// // // // // // // //                     );
// // // // // // // //                   },
// // // // // // // //                   icon: Icon(IconlyBroken.delete),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //             body:
// // // // // // // // MasonryGridView.count(
// // // // // // // //               // itemCount: wishlistItemsList.length,
// // // // // // // //               itemCount: 10,
// // // // // // // //               crossAxisCount: 2,
// // // // // // // //               // mainAxisSpacing: 16,
// // // // // // // //               // crossAxisSpacing: 20,
// // // // // // // //               itemBuilder: (context, index) {
// // // // // // // //                 return WishlistItem();
// // // // // // // //                 // return ChangeNotifierProvider.value(
// // // // // // // //                 //     value: wishlistItemsList[index],
// // // // // // // //                 //     child: const WishlistWidget());
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // // // // // // import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// // // // // // // // import 'package:grocery_app/core/helper/functions/build_error_bar.dart';
// // // // // // // import 'package:grocery_app/core/helper/functions/global_methods.dart';
// // // // // // // import 'package:grocery_app/core/widgets/custom_text.dart';
// // // // // // // import 'package:grocery_app/core/widgets/empty_screen.dart';
// // // // // // // // import 'package:grocery_app/features/home/presentation/views/widgets/product_item.dart';
// // // // // // // import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

// // // // // // // import '../../../core/cubits/wishlist_cubit/wishlist_cubit.dart';

// // // // // // // // import '../../core/cubits/wishlist_cubit/wishlist_cubit.dart';

// // // // // // // class WishlistView extends StatelessWidget {
// // // // // // //   static const routeName = 'WishlistScreen';
// // // // // // //   const WishlistView({super.key});

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // // // // // //       builder: (context, state) {
// // // // // // //         final items = (state is WishlistUpdated) ? state.wishlistItems : [];

// // // // // // //         if (items.isEmpty) {
// // // // // // //           return Scaffold(
// // // // // // //             body: EmptyScreen(
// // // // // // //               title: 'Your Wishlist Is Empty',
// // // // // // //               subtitle: 'Explore more and shortlist some items',
// // // // // // //               imagePath: 'assets/images/wishlist.png',
// // // // // // //               buttonText: 'Add a wish',
// // // // // // //             ),
// // // // // // //           );
// // // // // // //         }

// // // // // // //         return Scaffold(
// // // // // // //           appBar: AppBar(
// // // // // // //             title: CustomText(text: "Wishlist (${items.length})"),
// // // // // // //             actions: [
// // // // // // //               IconButton(
// // // // // // //                 onPressed: () {
// // // // // // //                   // MyAppMethods.showErrorORWarningDialog(
// // // // // // //                   //   isError: false,
// // // // // // //                   //   context: context,
// // // // // // //                   //
// // // // // // //                   //
// // // // // // //                   // );
// // // // // // //                   GlobalMethods.showErrorORWarningDialog(
// // // // // // //                     //     title: state.toString(),
// // // // // // //                     subtitle: "Remove all items",
// // // // // // //                     fct: () async {
// // // // // // //                       context.read<WishlistCubit>().clearWishlist();
// // // // // // //                     },
// // // // // // //                     context: context,
// // // // // // //                   );
// // // // // // //                   // showBar(context, message)
// // // // // // //                 },
// // // // // // //                 icon: const Icon(
// // // // // // //                   Icons.delete_forever_rounded,
// // // // // // //                   color: Colors.red,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           body: MasonryGridView.count(
// // // // // // //             itemCount: 10,
// // // // // // //             crossAxisCount: 2,
// // // // // // //             mainAxisSpacing: 16,
// // // // // // //             crossAxisSpacing: 20,
// // // // // // //             itemBuilder: (context, index) {
// // // // // // //               final productId = items[index].productId;
// // // // // // //               final productEntity = context.read<ProductsCubit>().findByProdId(
// // // // // // //                 productId,
// // // // // // //               );

// // // // // // //               if (productEntity == null) {
// // // // // // //                 return const SizedBox.shrink();
// // // // // // //               }

// // // // // // //               return WishlistItem(productEntity: productEntity);
// // // // // // //               // return ChangeNotifierProvider.value(
// // // // // // //               //   value: wishlistItemsList[index],
// // // // // // //               //   child: const WishlistWidget(),
// // // // // // //               // );
// // // // // // //             },
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // // // // // import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// // // // // // import 'package:grocery_app/core/helper/functions/global_methods.dart';
// // // // // // import 'package:grocery_app/core/widgets/custom_text.dart';
// // // // // // import 'package:grocery_app/core/widgets/empty_screen.dart';
// // // // // // import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';
// // // // // // import '../../../core/cubits/wishlist_cubit/wishlist_cubit.dart';

// // // // // // class WishlistView extends StatelessWidget {
// // // // // //   static const routeName = 'WishlistScreen';
// // // // // //   const WishlistView({super.key});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // // // // //       builder: (context, state) {
// // // // // //         final items = (state is WishlistUpdated) ? state.wishlistItems : [];

// // // // // //         if (items.isEmpty) {
// // // // // //           return Scaffold(
// // // // // // body: EmptyScreen(
// // // // // //   title: 'Your Wishlist Is Empty',
// // // // // //   subtitle: 'Explore more and shortlist some items',
// // // // // //   imagePath: 'assets/images/wishlist.png',
// // // // // //   buttonText: 'Add a wish',
// // // // // // ),
// // // // // //           );
// // // // // //         }

// // // // // //         return Scaffold(
// // // // // //           appBar: AppBar(
// // // // // //             title: CustomText(text: "Wishlist (${items.length})"),
// // // // // //             actions: [
// // // // // //               IconButton(
// // // // // //                 onPressed: () {
// // // // // //                   GlobalMethods.showErrorORWarningDialog(
// // // // // //                     subtitle: "Remove all items",
// // // // // //                     fct: () async {
// // // // // //                       context.read<WishlistCubit>().clearWishlist();
// // // // // //                     },
// // // // // //                     context: context,
// // // // // //                   );
// // // // // //                 },
// // // // // //                 icon: const Icon(
// // // // // //                   Icons.delete_forever_rounded,
// // // // // //                   color: Colors.red,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           body: MasonryGridView.count(
// // // // // //             itemCount: items.length,
// // // // // //             crossAxisCount: 2,
// // // // // //             mainAxisSpacing: 16,
// // // // // //             crossAxisSpacing: 20,
// // // // // //             itemBuilder: (context, index) {
// // // // // //               print("🟢 wishlist length = ${items.length}");
// // // // // //               final productId = items[index].productId;
// // // // // //               print("🟢 wishlist productId[$index] = $productId");

// // // // // //               final productEntity = context.read<ProductsCubit>().findByProdId(
// // // // // //                 productId,
// // // // // //               );
// // // // // //               print("🟢 found productEntity = $productEntity");

// // // // // //               if (productEntity == null) {
// // // // // //                 print("❌ productEntity not found for id $productId");
// // // // // //                 return const SizedBox.shrink();
// // // // // //               }

// // // // // //               return WishlistItem(productEntity: productEntity);
// // // // // //             },
// // // // // //           ),
// // // // // //         );

// // // // //         // body: MasonryGridView.count(
// // // // //         //   itemCount: items.length, // ✅ عدّلناها
// // // // //         //   crossAxisCount: 2,
// // // // //         //   mainAxisSpacing: 16,
// // // // //         //   crossAxisSpacing: 20,
// // // // //         //   itemBuilder: (context, index) {
// // // // //         //     final productId = items[index].productId;
// // // // //         //     final productEntity = context.read<ProductsCubit>().findByProdId(
// // // // //         //       productId,
// // // // //         //     );

// // // // //         //     if (productEntity == null) return const SizedBox.shrink();

// // // // //         //     return WishlistItem(productEntity: productEntity);
// // // // //         //   },
// // // // //         // ),
// // // // // //         // );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// // // // // import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
// // // // // import 'package:grocery_app/core/helper/functions/global_methods.dart';
// // // // // import 'package:grocery_app/core/widgets/custom_text.dart';
// // // // // import 'package:grocery_app/core/widgets/empty_screen.dart';
// // // // // import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

// // // // // class WishlistView extends StatelessWidget {
// // // // //   static const routeName = 'WishlistScreen';
// // // // //   const WishlistView({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // // // //       builder: (context, state) {
// // // // //         if (state is WishlistLoading) {
// // // // //           return const Scaffold(
// // // // //             body: Center(child: CircularProgressIndicator()),
// // // // //           );
// // // // //         }

// // // // //         if (state is WishlistFailure) {
// // // // //           return Scaffold(body: Center(child: Text(state.message)));
// // // // //         }

// // // // //         if (state is WishlistSuccess) {
// // // // //           final items = state.wishlistItems;

// // // // //           if (items.isEmpty) {
// // // // //             return Scaffold(
// // // // //               body: EmptyScreen(
// // // // //                 title: 'Your Wishlist Is Empty',
// // // // //                 subtitle: 'Explore more and shortlist some items',
// // // // //                 imagePath: 'assets/images/wishlist.png',
// // // // //                 buttonText: 'Add a wish',
// // // // //               ),
// // // // //             );
// // // // //           }

// // // // //           return Scaffold(
// // // // //             appBar: AppBar(
// // // // //               title: CustomText(text: "Wishlist (${items.length})"),
// // // // //               actions: [
// // // // //                 IconButton(
// // // // //                   onPressed: () {
// // // // //                     GlobalMethods.showErrorORWarningDialog(
// // // // //                       subtitle: "Remove all items",
// // // // //                       fct: () async {
// // // // //                         context.read<WishlistCubit>().clearWishlist();
// // // // //                       },
// // // // //                       context: context,
// // // // //                     );
// // // // //                   },
// // // // //                   icon: const Icon(
// // // // //                     Icons.delete_forever_rounded,
// // // // //                     color: Colors.red,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             body: DynamicHeightGridView(
// // // // //               itemCount: items.length,
// // // // //               builder: (context, index) {
// // // // //                 final productId = items[index].productId;
// // // // //                 final productEntity = context
// // // // //                     .read<ProductsCubit>()
// // // // //                     .findByProdId(productId);

// // // // //                 if (productEntity == null) return const SizedBox.shrink();

// // // // //                 return WishlistItem(productEntity: productEntity);
// // // // //               },
// // // // //               crossAxisCount: 2,
// // // // //             ),
// // // // //           );
// // // // //         }

// // // // //         // الحالة الابتدائية أو أي حالة أخرى
// // // // //         return const Scaffold(body: Center(child: CircularProgressIndicator()));
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:grocery_app/features/inner_screens/wishlist/wishlist_cubit/wishlist_cubit.dart';
// // // // import 'wishlist_item.dart';

// // // // class WishlistView extends StatelessWidget {
// // // //   static const routeName = 'WishlistScreen';
// // // //   const WishlistView({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // // //       builder: (context, state) {
// // // //         if (state is WishlistSuccess) {
// // // //           final List<WishlistModel> items = state.wishlistItems;
// // // //           if (items.isEmpty) {
// // // //             return EmptyScreen(
// // // //               title: 'Your Wishlist Is Empty',
// // // //               subtitle: 'Explore more and shortlist some items',
// // // //               imagePath: 'assets/images/wishlist.png',
// // // //               buttonText: 'Add a wish',
// // // //             );
// // // //           }

// // // //           final productsCubit = context.read<ProductsCubit>();

// // // //           return Scaffold(
// // // //             appBar: AppBar(
// // // //               title: CustomText(text: "Wishlist (${items.length})"),
// // // //               actions: [
// // // //                 IconButton(
// // // //                   onPressed: () =>
// // // //                       context.read<WishlistCubit>().clearWishlist(),
// // // //                   icon: const Icon(
// // // //                     Icons.delete_forever_rounded,
// // // //                     color: Colors.red,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             body: MasonryGridView.count(
// // // //               itemCount: items.length,
// // // //               //  itemCount: 3,
// // // //               crossAxisCount: 2,
// // // //               // mainAxisSpacing: 16,
// // // //               // crossAxisSpacing: 20,
// // // //               itemBuilder: (context, index) {
// // // //                 final productId = items[index].productId;
// // // //                 final productEntity = productsCubit.findByProdId(productId);

// // // //                 //  if (productEntity == null) return const SizedBox.shrink();

// // // //                 return WishlistItem(productEntity: productEntity!);
// // // //                 // return Text("dewdwedwedw${index.toString()}");
// // // //               },
// // // //             ),
// // // //             // body: DynamicHeightGridView(
// // // //             //   itemCount: items.length,
// // // //             //   crossAxisCount: 2,
// // // //             //   builder: (context, index) {

// // // //             //   },
// // // //             // ),
// // // //           );
// // // //         } else if (state is WishlistFailure) {
// // // //           return Scaffold(body: Center(child: Text(state.message)));
// // // //         } else {
// // // //           return const Scaffold(
// // // //             body: Center(child: CircularProgressIndicator()),
// // // //           );
// // // //         }
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// // // // // import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// // // // // import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
// // // // // import 'package:grocery_app/core/widgets/custom_text.dart';
// // // // // import 'package:grocery_app/core/widgets/empty_screen.dart';
// // // // // import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

// // // // // class WishlistView extends StatelessWidget {
// // // // //   static const routeName = 'WishlistScreen';
// // // // //   const WishlistView({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // // // //       builder: (context, state) {
// // // // //         if (state is WishlistSuccess) {
// // // // //           final items = state.wishlistItems;

// // // // //           if (items.isEmpty) {
// // // // //             return const Scaffold(
// // // // //               body: EmptyScreen(
// // // // //                 title: 'Your Wishlist Is Empty',
// // // // //                 subtitle: 'Explore more and shortlist some items',
// // // // //                 imagePath: 'assets/images/wishlist.png',
// // // // //                 buttonText: 'Add a wish',
// // // // //               ),
// // // // //             );
// // // // //           }

// // // // //           final productsCubit = context.read<ProductsCubit>();

// // // // //           return Scaffold(
// // // // //             appBar: AppBar(
// // // // //               title: CustomText(text: "Wishlist (${items.length})"),
// // // // //               actions: [
// // // // //                 IconButton(
// // // // //                   onPressed: () =>
// // // // //                       context.read<WishlistCubit>().clearWishlist(),
// // // // //                   icon: const Icon(
// // // // //                     Icons.delete_forever_rounded,
// // // // //                     color: Colors.red,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             body: DynamicHeightGridView(
// // // // //               itemCount: items.length,
// // // // //               crossAxisCount: 2,
// // // // //               builder: (context, index) {
// // // // //                 final productId = items[index].productId;
// // // // //                 final productEntity = productsCubit.findByProdId(productId);

// // // // //                 if (productEntity == null) return const SizedBox.shrink();

// // // // //                 return WishlistItem(productEntity: productEntity);
// // // // //               },
// // // // //             ),
// // // // //           );
// // // // //         } else if (state is WishlistFailure) {
// // // // //           return Scaffold(body: Center(child: Text(state.message)));
// // // // //         } else {
// // // // //           return const Scaffold(
// // // // //             body: Center(child: CircularProgressIndicator()),
// // // // //           );
// // // // //         }
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocBuilder<WishlistCubit, WishlistState>(
// // //       builder: (context, state) {
// // //         if (state is WishlistSuccess) {
// // //           final items = state.wishlistItems;

// // //           if (items.isEmpty) {
// // //             return const Scaffold(
// // //               body: EmptyScreen(
// // //                 title: 'Your Wishlist Is Empty',
// // //                 subtitle: 'Explore more and shortlist some items',
// // //                 imagePath: 'assets/images/wishlist.png',
// // //                 buttonText: 'Add a wish',
// // //               ),
// // //             );
// // //           }

// // //           final productsState = context.watch<ProductsCubit>().state;
// // //           if (productsState is! ProductsSuccess) {
// // //             return const Scaffold(
// // //               body: Center(child: CircularProgressIndicator()),
// // //             );
// // //           }

// // //           final ProductsCubit productsCubit = context.read<ProductsCubit>();

// // //           return Scaffold(
// // //             appBar: AppBar(
// // //               title: Text("Wishlist (${items.length})"),
// // //               actions: [
// // //                 IconButton(
// // //                   onPressed: () =>
// // //                       context.read<WishlistCubit>().clearWishlist(),
// // //                   icon: const Icon(
// // //                     Icons.delete_forever_rounded,
// // //                     color: Colors.red,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             body: MasonryGridView.count(
// // //               itemCount: items.length,
// // //               crossAxisCount: 2,
// // //               itemBuilder: (context, index) {
// // //                 final productId = items[index].productId;
// // //                 final ProductEntity? productEntity = productsCubit.findByProdId(
// // //                   productId,
// // //                 );

// // //                 if (productEntity == null) {
// // //                   // المنتج غير موجود (ممكن انحذف أو لسه ما تحمل)
// // //                   return const SizedBox.shrink();
// // //                 }

// // //                 return WishlistItem(productEntity: productEntity);
// // //               },

// // //               // itemBuilder: (context, index) {
// // //               //   final productId = items[index].productId;
// // //               //   final ProductEntity? productEntity = productsCubit.findByProdId(
// // //               //     productId,
// // //               //   );

// // //               //   //  if (productEntity == null) return const SizedBox.shrink();

// // //               //   return WishlistItem(productEntity: productEntity!);
// // //               // },
// // //             ),
// // //           );
// // //         } else if (state is WishlistFailure) {
// // //           return Scaffold(body: Center(child: Text(state.message)));
// // //         } else {
// // //           return const Scaffold(
// // //             body: Center(child: CircularProgressIndicator()),
// // //           );
// // //         }
// // //       },
// // //     );
// // //   }
// // // }

// // class WishlistView extends StatelessWidget {
// //   static const routeName = 'WishlistScreen';
// //   const WishlistView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<WishlistCubit, WishlistState>(
// //       builder: (context, wishlistState) {
// //         if (wishlistState is WishlistSuccess) {
// //           final items = wishlistState.wishlistItems;
// //           showBar(context, "WishlistSuccess");
// //           if (items.isEmpty) {
// //             return const Scaffold(
// //               body: EmptyScreen(
// //                 title: 'Your Wishlist Is Empty',
// //                 subtitle: 'Explore more and shortlist some items',
// //                 imagePath: 'assets/images/wishlist.png',
// //                 buttonText: 'Add a wish',
// //               ),
// //             );
// //           }

// //           return BlocBuilder<ProductsCubit, ProductsState>(
// //             builder: (context, productsState) {
// //               if (productsState is ProductsLoading ||
// //                   productsState is ProductsInitial) {
// //                 return const Scaffold(
// //                   body: Center(child: CircularProgressIndicator()),
// //                 );
// //               }

// //               if (productsState is ProductsFailure) {
// //                 return Scaffold(body: Center(child: Text('error')));
// //               }

// //               if (productsState is ProductsSuccess) {
// //                 final productsCubit = context.read<ProductsCubit>();

// //                 return Scaffold(
// //                   appBar: AppBar(
// //                     title: Text("Wishlist (${items.length})"),
// //                     actions: [
// //                       IconButton(
// //                         onPressed: () =>
// //                             context.read<WishlistCubit>().clearWishlist(),
// //                         icon: const Icon(
// //                           Icons.delete_forever_rounded,
// //                           color: Colors.red,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   body: MasonryGridView.count(
// //                     itemCount: items.length,
// //                     crossAxisCount: 2,
// //                     itemBuilder: (context, index) {
// //                       final productId = items[index].productId;
// //                       final productEntity = productsCubit.findByProdId(
// //                         productId,
// //                       );

// //                       // if (productEntity == null) {
// //                       //   // المنتج غير موجود لسه
// //                       //   return const SizedBox.shrink();
// //                       // }

// //                       return WishlistItem(productEntity: productEntity!);
// //                     },
// //                   ),
// //                 );
// //               }

// //               return const SizedBox.shrink();
// //             },
// //           );
// //         } else if (wishlistState is WishlistFailure) {
// //           return Scaffold(body: Center(child: Text(wishlistState.message)));
// //         } else {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
// import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/core/helper/functions/build_error_bar.dart';
// import 'package:grocery_app/core/widgets/empty_screen.dart';
// import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

// class WishlistView extends StatelessWidget {
//   static const routeName = 'WishlistScreen';
//   const WishlistView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<WishlistCubit, WishlistState>(
//       listener: (context, state) {
//         if (state is WishlistSuccess && state.message.isNotEmpty) {
//           showBar(context, state.message); // عرض رسالة النجاح
//         } else if (state is WishlistFailure) {
//           showBar(context, state.message); // عرض رسالة الفشل
//         }
//       },
//       builder: (context, wishlistState) {
//         if (wishlistState is WishlistSuccess) {
//           final items = wishlistState.wishlistItems;

//           // عرض شاشة فارغة إذا المفضلة خالية
//           if (items.isEmpty) {
//             return const Scaffold(
//               body: EmptyScreen(
//                 title: 'Your Wishlist Is Empty',
//                 subtitle: 'Explore more and shortlist some items',
//                 imagePath: 'assets/images/wishlist.png',
//                 buttonText: 'Add a wish',
//               ),
//             );
//           }

//           return BlocBuilder<ProductsCubit, ProductsState>(
//             builder: (context, productsState) {
//               if (productsState is ProductsLoading ||
//                   productsState is ProductsInitial) {
//                 return const Scaffold(
//                   body: Center(child: CircularProgressIndicator()),
//                 );
//               }

//               if (productsState is ProductsFailure) {
//                 return const Scaffold(
//                   body: Center(child: Text('Error loading products')),
//                 );
//               }

//               if (productsState is ProductsSuccess) {
//                 final productsCubit = context.read<ProductsCubit>();

//                 // فلترة المنتجات الموجودة فقط
//                 final wishlistProducts = items
//                     .map((item) => productsCubit.findByProdId(item.productId))
//                     .where((product) => product != null)
//                     .cast<ProductEntity>()
//                     .toList();

//                 // رسالة إذا لا توجد منتجات مطابقة
//                 if (wishlistProducts.isEmpty) {
//                   return const Scaffold(
//                     body: Center(
//                       child: Text("No products found for your wishlist"),
//                     ),
//                   );
//                 }

//                 return Scaffold(
//                   appBar: AppBar(
//                     title: Text("Wishlist (${wishlistProducts.length})"),
//                     actions: [
//                       IconButton(
//                         onPressed: () =>
//                             context.read<WishlistCubit>().clearWishlist(),
//                         icon: const Icon(
//                           Icons.delete_forever_rounded,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                   body: MasonryGridView.count(
//                     itemCount: wishlistProducts.length,
//                     crossAxisCount: 2,
//                     itemBuilder: (context, index) {
//                       return WishlistItem(
//                         productEntity: wishlistProducts[index],
//                       );
//                     },
//                   ),
//                 );
//               }

//               return const SizedBox.shrink();
//             },
//           );
//         } else if (wishlistState is WishlistFailure) {
//           return Scaffold(body: Center(child: Text(wishlistState.message)));
//         } else {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }
//       },
//     );
//   }
// }\
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:grocery_app/core/widgets/empty_screen.dart';
import 'package:grocery_app/features/inner_screens/wishlist/wishlist_widget.dart';

class WishlistView extends StatelessWidget {
  static const routeName = 'WishlistScreen';
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final items = (state is WishlistUpdated) ? state.wishlistItems : [];

        if (items.isEmpty) {
          return const Scaffold(
            body: EmptyScreen(
              title: 'Your Wishlist Is Empty',
              subtitle: 'Explore more and shortlist some items',
              imagePath: 'assets/images/wishlist.png',
              buttonText: 'Add a wish',
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Wishlist (${items.length})"),
            actions: [
              IconButton(
                onPressed: () => context.read<WishlistCubit>().clearWishlist(),
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          body: MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final productId = items[index].productId;
              final productEntity = context.read<ProductsCubit>().findByProdId(
                productId,
              );

              if (productEntity == null) {
                return const SizedBox.shrink();
              }

              return WishlistItem(productEntity: productEntity);
            },
          ),
        );
      },
    );
  }
}
