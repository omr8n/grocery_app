// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/cart_widget.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/custom_chekout.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/helper/functions/global_methods.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/empty_screen.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmdty = true;

    Size size = Utils(context).getScreenSize;
    // final cartProvider = Provider.of<CartProvider>(context);
    // final cartItemsList =
    //     cartProvider.getCartItems.values.toList().reversed.toList();
    // return cartItemsList.isEmpty
    return isEmdty
        ? const EmptyScreen(
            title: 'Your cart is empty',
            subtitle: 'Add something and make me happy :)',
            buttonText: 'Shop now',
            imagePath: 'assets/images/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              //  backgroundColor: Theme.of(context).cardColor,
              title: CustomText(
                //    text: 'Cart (${cartItemsList.length})',
                text: r'Cart $342)',

                isTitle: true,
                fontSize: 22,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: 'Empty your cart?',
                      subtitle: 'Are you sure?',
                      fct: () async {
                        // await cartProvider.clearOnlineCart();
                        // cartProvider.clearLocalCart();
                      },
                      context: context,
                    );
                  },
                  icon: Icon(IconlyBroken.delete),
                ),
              ],
            ),
            body: Column(
              children: [
                CustomChekout(),
                Expanded(
                  child: ListView.builder(
                    //itemCount: cartItemsList.length,
                    itemCount: 32,
                    itemBuilder: (ctx, index) {
                      // return ChangeNotifierProvider.value(
                      //     value: cartItemsList[index],
                      //     child: CartWidget(
                      //       q: cartItemsList[index].quantity,
                      //     ));
                      return CartWidget();
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
