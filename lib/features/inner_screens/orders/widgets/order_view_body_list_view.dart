// import 'package:flutter/material.dart';
// import 'package:grocery_app/core/entites/order_entity.dart';
// import 'package:grocery_app/features/inner_screens/orders/order_item.dart';

// // // import '../order_item.dart';

// // class OrderViewBodyListView extends StatelessWidget {
// //   const OrderViewBodyListView({super.key, required this.orders});
// //   final List<OrderEntity> orders;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.separated(
// //       //          itemCount: ordersList.length,
// //       itemCount: 12,
// //       itemBuilder: (ctx, index) {
// //         return Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
// //           // child: ChangeNotifierProvider.value(
// //           //   value: ordersList[index],
// //           //   child: const OrderWidget(),
// //           // ),
// //           child: OrderItem(order: orders[index]),
// //         );
// //       },
// //       separatorBuilder: (BuildContext context, int index) {
// //         return Divider(thickness: 1);
// //       },
// //     );
// //   }
// // }
// class OrderViewBodyListView extends StatelessWidget {
//   const OrderViewBodyListView({super.key, required this.orders});
//   final List<OrderEntity> orders;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: orders.length, // ← هنا بدل 12 ثابت
//       itemBuilder: (ctx, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
//           child: OrderItem(order: orders[index]),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const Divider(thickness: 1);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:grocery_app/core/entites/order_entity.dart';
import 'package:grocery_app/features/inner_screens/orders/order_item.dart';

class OrderViewBodyListView extends StatelessWidget {
  const OrderViewBodyListView({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: OrderItem(order: orders[index]),
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
