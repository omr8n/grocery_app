import 'package:flutter/material.dart';
import 'package:grocery_app/features/cart/presentation/view/widgets/cart_widget.dart';

import '../../../domain/entites/cart_item_entity.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
