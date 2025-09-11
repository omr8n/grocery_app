// // class HeartBottonWidget extends StatelessWidget {
// //   const HeartBottonWidget({
// //     super.key,
// //     required this.size,
// //     this.color = Colors.transparent,
// //     this.iconColor = Colors.white,
// //     required this.productId,
// //     // required bool isInWishlist,
// //   });

// //   final double size;
// //   final Color color;
// //   final Color iconColor;
// //   final String productId;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(shape: BoxShape.circle, color: color),
// //       child: Center(
// //         child: BlocBuilder<WishlistCubit, WishlistState>(
// //           builder: (context, state) {
// //             final isInWishlist = context
// //                 .watch<WishlistCubit>()
// //                 .isProductInWishlist(productId);
// //             return GestureDetector(
// //               onTap: () async {
// //                 context.read<WishlistCubit>().addOrRemoveFromWishlist(
// //                   productId,
// //                   context, // تمرير الـ context هنا ضروري لعرض الـ Dialog
// //                 );
// //               },
// //               child: Icon(
// //                 isInWishlist ? IconlyBold.heart : IconlyLight.heart,
// //                 size: size,
// //                 color: isInWishlist ? Colors.red : Colors.grey,
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// class HeartBottonWidget extends StatelessWidget {
//   const HeartBottonWidget({
//     super.key,
//     required this.size,
//     this.color = Colors.transparent,
//     this.iconColor = Colors.white,
//     required this.product,
//   });

//   final double size;
//   final Color color;
//   final Color iconColor;
//   final ProductEntity product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//       child: Center(
//         child: BlocBuilder<WishlistCubit, WishlistState>(
//           builder: (context, state) {
//             final isInWishlist = context
//                 .watch<WishlistCubit>()
//                 .isProductInWishlist(product.productId);
//             return GestureDetector(
//               onTap: () {
//                 context.read<WishlistCubit>().addOrRemoveFromWishlist(
//                   product.productId,
//                 );
//               },
//               child: Icon(
//                 isInWishlist ? IconlyBold.heart : IconlyLight.heart,
//                 size: size,
//                 color: isInWishlist ? Colors.red : Colors.grey,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// //

// // // import 'package:grocery_app/consts/firebase_consts.dart';
// // // import 'package:provider/provider.dart';

// // // import '../providers/products_provider.dart';
// // // import '../providers/wishlist_provider.dart';
// // // import '../services/global_methods.dart';

// // // class HeartBTN extends StatefulWidget {
// // //   const HeartBTN(
// // //       {super.key, required this.productId, this.isInWishlist = false});
// // //   final String productId;
// // //   final bool? isInWishlist;

// // //   @override
// // //   State<HeartBTN> createState() => _HeartBTNState();
// // // }

// // // class _HeartBTNState extends State<HeartBTN> {
// // //   bool loading = false;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     //  final productProvider = Provider.of<ProductsProvider>(context);
// // //     //  final getCurrProduct = productProvider.findProdById(widget.productId);
// // //     // final wishlistProvider = Provider.of<WishlistProvider>(context);

// // //     return GestureDetector(
// // //       onTap: () async {
// // //         // setState(() {
// // //         //   loading = true;
// // //         // });
// // //         // try {
// // //         //   final User? user = authInstance.currentUser;

// // //         //   if (user == null) {
// // //         //     GlobalMethods.errorDialog(
// // //         //         subtitle: 'No user found, Please login first',
// // //         //         context: context);
// // //         //     return;
// // //         //   }
// // //         //   if (widget.isInWishlist == false && widget.isInWishlist != null) {
// // //         //     await GlobalMethods.addToWishlist(
// // //         //         productId: widget.productId, context: context);
// // //         //   } else {
// // //         //     await wishlistProvider.removeOneItem(
// // //         //         wishlistId:
// // //         //             wishlistProvider.getWishlistItems[getCurrProduct.id]!.id,
// // //         //         productId: widget.productId);
// // //         //   }
// // //         //   await wishlistProvider.fetchWishlist();
// // //         //   setState(() {
// // //         //     loading = false;
// // //         //   });
// // //         // } catch (error) {
// // //         //   GlobalMethods.errorDialog(subtitle: '$error', context: context);
// // //         // } finally {
// // //         //   setState(() {
// // //         //     loading = false;
// // //         //   });
// // //         // }
// // //         // print('user id is ${user.uid}');
// // //         // wishlistProvider.addRemoveProductToWishlist(productId: productId);
// // //       },
// // //       child: loading
// // //           ? const Padding(
// // //               padding: EdgeInsets.all(8.0),
// // //               child: SizedBox(
// // //                   height: 15, width: 15, child: CircularProgressIndicator()),
// // //             )
// // //           : Icon(
// // //               widget.isInWishlist != null && widget.isInWishlist == true
// // //                   ? IconlyBold.heart
// // //                   : IconlyLight.heart,
// // //               size: 22,
// // //               color: widget.isInWishlist != null && widget.isInWishlist == true
// // //                   ? Colors.red
// // //                   : Colors.white,
// // //             ),
// // //     );
// // //   }
// // // }

// // // import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:grocery_app/core/entites/product_entity.dart';

class HeartBottonWidget extends StatelessWidget {
  const HeartBottonWidget({
    super.key,
    required this.size,
    this.color = Colors.transparent,
    this.iconColor = Colors.white,
    required this.product,
  });

  final double size;
  final Color color;
  final Color iconColor;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            final isInWishlist = context
                .watch<WishlistCubit>()
                .isProductInWishlist(product.productId);
            return GestureDetector(
              onTap: () {
                context.read<WishlistCubit>().addOrRemoveFromWishlist(
                  product.productId,
                  context,
                );
              },
              child: Icon(
                isInWishlist ? IconlyBold.heart : IconlyLight.heart,
                size: size,
                color: isInWishlist ? Colors.red : Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
