// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// // class AddCartButtonDetails extends StatefulWidget {
// //   const AddCartButtonDetails({super.key, required this.productEntity});
// //   final ProductEntity productEntity;

// //   @override
// //   State<AddCartButtonDetails> createState() => _AddCartButtonDetailsState();
// // }

// // class _AddCartButtonDetailsState extends State<AddCartButtonDetails> {
// //   bool _isTapped = false;

// //   void _onTapAddToCart() {
// //     setState(() => _isTapped = true);

// //     Future.delayed(const Duration(milliseconds: 200), () {
// //       if (mounted) setState(() => _isTapped = false);
// //     });

// //     context.read<CartCubit>().addProductWithAuthCheck(widget.productEntity);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final isInCart = context.select<CartCubit, bool>(
// //       (cubit) => cubit.isProductInCart(widget.productEntity.productId),
// //     );

// //     return AnimatedScale(
// //       scale: _isTapped ? 1.1 : 1.0,
// //       duration: const Duration(milliseconds: 200),
// //       child: Material(
// //         color: Colors.green,
// //         borderRadius: BorderRadius.circular(10),
// //         child: InkWell(
// //           //         await GlobalMethods.addToCart(
// //           //             productId: getCurrProduct.id,
// //           //             quantity: int.parse(
// //           //                 _quantityTextController.text),
// //           //             context: context);
// //           //         await cartProvider.fetchCart();
// //           //         // cartProvider.addProductsToCart(
// //           //         //     productId: getCurrProduct.id,
// //           //         //     quantity: int.parse(
// //           //         //         _quantityTextController.text));
// //           //       },
// //           onTap: _onTapAddToCart,
// //           borderRadius: BorderRadius.circular(10),
// //           child: Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: CustomText(
// //               // text:
// //               //     _isInCart ? 'In cart' : 'Add to cart',
// //               text: isInCart ? 'In cart' : 'Add to cart',
// //               color: Colors.white,
// //               fontSize: 18,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// class AddCartButtonDetails extends StatefulWidget {
//   const AddCartButtonDetails({
//     super.key,
//     required this.productEntity,
//     required this.quantity,
//   });

//   final ProductEntity productEntity;
//   final int quantity;

//   @override
//   State<AddCartButtonDetails> createState() => _AddCartButtonDetailsState();
// }

// class _AddCartButtonDetailsState extends State<AddCartButtonDetails> {
//   bool _isTapped = false;

//   void _onTapAddToCart() {
//     setState(() => _isTapped = true);

//     Future.delayed(const Duration(milliseconds: 200), () {
//       if (mounted) setState(() => _isTapped = false);
//     });

//     // 🔥 نمرر quantity
//     context.read<CartCubit>().addProductWithAuthCheck(
//       widget.productEntity,
//       quantity: widget.quantity,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isInCart = context.select<CartCubit, bool>(
//       (cubit) => cubit.isProductInCart(widget.productEntity.productId),
//     );

//     return AnimatedScale(
//       scale: _isTapped ? 1.1 : 1.0,
//       duration: const Duration(milliseconds: 200),
//       child: Material(
//         color: Colors.green,
//         borderRadius: BorderRadius.circular(10),
//         child: InkWell(
//           onTap: _onTapAddToCart,
//           borderRadius: BorderRadius.circular(10),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: CustomText(
//               text: isInCart ? 'In cart' : 'Add to cart',
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

class AddCartButtonDetails extends StatefulWidget {
  const AddCartButtonDetails({
    super.key,
    required this.productEntity,
    required this.quantity,
  });

  final ProductEntity productEntity;
  final int quantity;

  @override
  State<AddCartButtonDetails> createState() => _AddCartButtonDetailsState();
}

class _AddCartButtonDetailsState extends State<AddCartButtonDetails> {
  bool _isTapped = false;

  void _onTapAddToCart() {
    setState(() => _isTapped = true);

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() => _isTapped = false);
    });

    // 🔥 نمرر quantity
    context.read<CartCubit>().addProductWithAuthCheck(
      widget.productEntity,
      quantity: widget.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartCubit, bool>(
      (cubit) => cubit.isProductInCart(widget.productEntity.productId),
    );

    return AnimatedScale(
      scale: _isTapped ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: _onTapAddToCart,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomText(
              text: isInCart ? 'In cart' : 'Add to cart',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
