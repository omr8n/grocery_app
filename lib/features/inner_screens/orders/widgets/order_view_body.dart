// import 'package:flutter/material.dart';
// import 'package:grocery_app/core/entites/order_entity.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/core/widgets/empty_screen.dart';

// import '../../../../core/widgets/back_widget.dart';
// import 'order_view_body_list_view.dart';

// // class OrderViewBody extends StatelessWidget {
// //   const OrderViewBody({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: const BackWidget(),
// //         elevation: 0,
// //         centerTitle: false,
// //         title: CustomText(
// //           //     text: 'Your orders (${ordersList.length})',
// //           text: 'Your orders (\$32)',

// //           fontSize: 24.0,
// //           isTitle: true,
// //         ),
// //         backgroundColor: Theme.of(
// //           context,
// //         ).scaffoldBackgroundColor.withOpacity(0.9),
// //       ),
// //       body: OrderViewBodyListView(),
// //     );
// //   }
// // }
// class OrderViewBody extends StatelessWidget {
//   final List<OrderEntity> ordersList; // ← أضف هذا
//   const OrderViewBody({super.key, required this.ordersList});

//   @override
//   Widget build(BuildContext context) {
//     return OrderViewBodyListView(orders: ordersList); // ← مرّره
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     leading: const BackWidget(),
//     //     elevation: 0,
//     //     centerTitle: false,
//     //     title: CustomText(
//     //       text: 'Your orders (${ordersList.length})',
//     //       fontSize: 24.0,
//     //       isTitle: true,
//     //     ),
//     //     backgroundColor: Theme.of(
//     //       context,
//     //     ).scaffoldBackgroundColor.withOpacity(0.9),
//     //   ),
//     //   body:
//     // ا هنا
//     //     // );
//   }
// }
import 'package:flutter/material.dart';
import 'package:grocery_app/core/entites/order_entity.dart';
import 'package:grocery_app/features/inner_screens/orders/widgets/order_view_body_list_view.dart';

class OrderViewBody extends StatelessWidget {
  final List<OrderEntity> ordersList;

  const OrderViewBody({super.key, required this.ordersList});

  @override
  Widget build(BuildContext context) {
    return OrderViewBodyListView(orders: ordersList);
  }
}
