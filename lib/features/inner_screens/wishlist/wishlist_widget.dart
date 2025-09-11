import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/core/widgets/heart_btn.dart';

// import 'package:provider/provider.dart';

import '../../../core/utils/utils.dart';
// import '../../../core/widgets/heart_btn.dart';
import '../product_details_view.dart';

// import '../../providers/products_provider.dart';
// import '../../providers/wishlist_provider.dart';
// import '../../services/utils.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductsProvider>(context);
    // final wishlistModel = Provider.of<WishlistModel>(context);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    // final getCurrProduct =
    //     productProvider.findProdById(wishlistModel.productId);
    // double usedPrice = getCurrProduct.isOnSale
    //     ? getCurrProduct.salePrice
    //     : getCurrProduct.price;
    // bool? _isInWishlist =
    //     wishlistProvider.getWishlistItems.containsKey(getCurrProduct.id);

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, ProductDetails.routeName,
          //     arguments: wishlistModel.productId);
          Navigator.pushNamed(context, ProductDetailsView.routeName);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  // width: size.width * 0.2,
                  height: size.width * 0.25,
                  child: FancyShimmerImage(
                    imageUrl: productEntity.imageUrl!,
                    // imageUrl:
                    //     "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconlyLight.bag2),
                          ),
                          HeartBottonWidget(size: 20, product: productEntity),
                        ],
                      ),
                    ),
                    CustomText(
                      //   text: getCurrProduct.title,
                      text: productEntity.name,

                      fontSize: 20.0,
                      maxLines: 2,
                      isTitle: true,
                    ),
                    const SizedBox(height: 5),
                    // CustomText(
                    //   // text: '\$${usedPrice.toStringAsFixed(2)}',
                    //   //  text: r"$54",
                    //   text: r"${productEntity.price}",
                    //   fontSize: 18.0,
                    //   maxLines: 1,
                    //   isTitle: true,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/core/widgets/heart_btn.dart';
// import '../../../core/utils/utils.dart';
// import '../product_details_view.dart';

// class WishlistItem extends StatelessWidget {
//   const WishlistItem({super.key,
//   //  required this.productEntity
//    });
//   // final ProductEntity productEntity;

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(
//             context,
//             ProductDetailsView.routeName,
//           //  arguments: productEntity.productId,
//           );
//         },
//         child: Container(
//           height: size.height * 0.20,
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             border: Border.all(width: 1),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Row(
//             children: [
//               Flexible(
//                 flex: 2,
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 8),
//                   height: size.width * 0.25,
//                   child: FancyShimmerImage(
//                     imageUrl: productEntity.imageUrl ?? '',
//                     boxFit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Flexible(
//                 flex: 3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(IconlyLight.bag2),
//                         ),
//                         HeartBottonWidget(
//                           size: 20,
//                           productId: productEntity.productId,
//                         ),
//                       ],
//                     ),
//                     CustomText(
//                       text: productEntity.name,
//                       fontSize: 20.0,
//                       maxLines: 2,
//                       isTitle: true,
//                     ),
//                     const SizedBox(height: 5),
//                     CustomText(
//                       text: "\$${productEntity.price}",
//                       fontSize: 18.0,
//                       maxLines: 1,
//                       isTitle: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
