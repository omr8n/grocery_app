import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/entites/product_entity.dart';

import '../../../../cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// class AddToCartButton extends StatefulWidget {
//   const AddToCartButton({
//     super.key,
//     // this.onPressed,
//     required this.productEntity,
//   });
//   // final void Function()? onPressed;
//   final ProductEntity productEntity;

//   @override
//   State<AddToCartButton> createState() => _AddToCartButtonState();
// }

// class _AddToCartButtonState extends State<AddToCartButton> {
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
//       child: SizedBox(
//         height: 45,
//         width: double.infinity,
//         child: TextButton(
//           style: ButtonStyle(
//             backgroundColor: WidgetStateProperty.all(
//               Theme.of(context).cardColor,
//             ),
//             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//               const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(12.0),
//                   bottomRight: Radius.circular(12.0),
//                 ),
//               ),
//             ),
//           ),
//           onPressed: _onTapAddToCart,
//           child: Text(
//             // "hh",
//             isInCart ? 'In cart' : 'Add to cart',
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }
class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
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
    final isInCart = context.select<CartCubit, bool>(
      (cubit) => cubit.isProductInCart(widget.productEntity.productId),
    );

    return AnimatedScale(
      scale: _isTapped ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).cardColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
            ),
          ),
          onPressed: _onTapAddToCart,
          child: Text(
            isInCart ? 'In cart' : 'Add to cart',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
