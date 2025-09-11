// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/cart_view_body.dart';
// import 'package:grocery_app/features/cart/presentation/view/widgets/cart_widget.dart';
// import 'package:grocery_app/features/cart/presentation/view/widgets/custom_chekout.dart';

import '../../../../core/helper/functions/global_methods.dart';
// import 'widgets/cart_view_body.dart';
// import '../../../../core/utils/utils.dart';
// import '../../../../core/widgets/empty_screen.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isEmdty = true;
    final itemCount = context.watch<CartCubit>().items.length;

    //  Size size = Utils(context).getScreenSize;
    // final cartProvider = Provider.of<CartProvider>(context);
    // final cartItemsList =
    //     cartProvider.getCartItems.values.toList().reversed.toList();
    // return cartItemsList.isEmpty
    return
    //  isEmdty
    //     ? const EmptyScreen(
    //         title: 'Your cart is empty',
    //         subtitle: 'Add something and make me happy :)',
    //         buttonText: 'Shop now',
    //         imagePath: 'assets/images/cart.png',
    //       )
    //     :
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        //  backgroundColor: Theme.of(context).cardColor,
        title: CustomText(
          text: 'Cart (${itemCount.toString()})',

          //  text: r'Cart $342)',
          isTitle: true,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            // onPressed: () {
            //   GlobalMethods.warningDialog(
            //     title: 'Empty your cart?',
            //     subtitle: 'Are you sure?',
            //     fct: () async {
            //       await GlobalMethods.showErrorORWarningDialog(
            //         isError: false,
            //         context: context,
            //         subtitle: "Remove all items?",
            //         fct: () {
            //           context.read<CartCubit>().clearCart();
            //         },
            //       );
            //       // await cartProvider.clearOnlineCart();
            //       // cartProvider.clearLocalCart();
            //     },
            //     context: context,
            //   );
            // },
            onPressed: () {
              if (context.read<CartCubit>().items.isNotEmpty) {
                GlobalMethods.showErrorORWarningDialog(
                  isError: false,
                  context: context,
                  subtitle: "Remove all items?",
                  fct: () {
                    context.read<CartCubit>().clearCart();
                  },
                );
              }
            },

            // onPressed: () {
            //   GlobalMethods.warningDialog(
            //     title: 'Empty your cart?',
            //     subtitle: 'Are you sure?',
            //     fct: () async {
            //       await GlobalMethods.showErrorORWarningDialog(
            //         isError: false,
            //         context: context,
            //         subtitle: "Remove all items?",
            //         fct: () {
            //           context.read<CartCubit>().clearCart();
            //         },
            //       );
            //     },
            //     context: context,
            //   );
            // },
            icon: Icon(IconlyBroken.delete),
          ),
        ],
      ),
      body: CartViewBody(),
    );
  }
}
