import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// class AddToCartButtonOnSale extends StatefulWidget {
//   const AddToCartButtonOnSale({super.key, required this.productEntity});
//   final ProductEntity productEntity;

//   @override
//   State<AddToCartButtonOnSale> createState() => _AddToCartButtonOnSaleState();
// }

// class _AddToCartButtonOnSaleState extends State<AddToCartButtonOnSale> {
//   bool _isTapped = false;

//   void _onTapAddToCart() {
//     setState(() => _isTapped = true);

//     Future.delayed(const Duration(milliseconds: 200), () {
//       if (mounted) setState(() => _isTapped = false);
//     });

//     context.read<CartCubit>().addProductWithAuthCheck(widget.productEntity);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isInCart = context.select<CartCubit, bool>(
//       (cubit) => cubit.isProductInCart(widget.productEntity.productId),
//     );
//     return AnimatedScale(
//       scale: _isTapped ? 1.1 : 1.0,
//       duration: const Duration(milliseconds: 200),
//       child: GestureDetector(
//         onTap: _onTapAddToCart,
//         // onTap: _isInCart
//         //     ? null
//         //     : () async {
//         //         final User? user =
//         //             authInstance.currentUser;

//         //         if (user == null) {
//         //           GlobalMethods.errorDialog(
//         //               subtitle:
//         //                   'No user found, Please login first',
//         //               context: context);
//         //           return;
//         //         }
//         //         await GlobalMethods.addToCart(
//         //             productId: productModel.id,
//         //             quantity: 1,
//         //             context: context);
//         //         await cartProvider.fetchCart();
//         //         // cartProvider.addProductsToCart(
//         //         //     productId: productModel.id,
//         //         //     quantity: 1);
//         //       },
//         //      child: Icon(IconlyLight.bag2, size: 22, color: Colors.green),
//         child: Icon(
//           isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
//           size: 22,
//           color: isInCart ? Colors.green : Theme.of(context).hintColor,
//         ),
//       ),
//     );
//   }
// }
class AddToCartButtonOnSale extends StatefulWidget {
  const AddToCartButtonOnSale({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<AddToCartButtonOnSale> createState() => _AddToCartButtonOnSaleState();
}

class _AddToCartButtonOnSaleState extends State<AddToCartButtonOnSale> {
  bool _isTapped = false;

  void _onTapAddToCart() {
    setState(() => _isTapped = true);

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() => _isTapped = false);
    });

    // context.read<CartCubit>().addProductWithAuthCheck(widget.productEntity);
    context.read<CartCubit>().addProduct(widget.productEntity);
  }

  @override
  Widget build(BuildContext context) {
    // الاستماع لحالة المنتج في السلة مباشرة من CartCubit
    final isInCart = context.select<CartCubit, bool>(
      (cubit) => cubit.isProductInCart(widget.productEntity.productId),
    );

    return AnimatedScale(
      scale: _isTapped ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: _onTapAddToCart,
        child: Icon(
          isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
          size: 22,
          color: isInCart ? Colors.green : Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
