import 'package:flutter/material.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../core/widgets/back_widget.dart';
import 'orders_widget.dart';

class OrdersView extends StatelessWidget {
  static const routeName = '/OrderScreen';

  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ordersProvider = Provider.of<OrdersProvider>(context);
    // final ordersList = ordersProvider.getOrders;
    //  bool isEmpty = true;
    // return FutureBuilder(
    //     future: ordersProvider.fetchOrders(),
    //     builder: (context, snapshot) {
    // return ordersList.isEmpty
    return
    // isEmpty
    // ? const EmptyScreen(
    //     title: 'You didnt place any order yet',
    //     subtitle: 'order something and make me happy :)',
    //     buttonText: 'Shop now',
    //     imagePath: 'assets/images/cart.png',
    //   )
    // :
    Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        centerTitle: false,
        title: CustomText(
          //     text: 'Your orders (${ordersList.length})',
          text: 'Your orders (\$32)',

          fontSize: 24.0,
          isTitle: true,
        ),
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: ListView.separated(
        //          itemCount: ordersList.length,
        itemCount: 12,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            // child: ChangeNotifierProvider.value(
            //   value: ordersList[index],
            //   child: const OrderWidget(),
            // ),
            child: OrderItem(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(thickness: 1);
        },
      ),
    );
    // });
  }
}
