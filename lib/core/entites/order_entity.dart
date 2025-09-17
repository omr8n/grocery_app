// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import '../../Features/cart/domain/entites/cart_entity.dart';
// // import 'order_product_entity.dart';

// // class OrderEntity {
// //   final double totalPrice;
// //   final String userName;
// //   final CartEntity cartEntity;
// //   final List<OrderProductEntity> orderProducts;
// //   final Timestamp orderDate;
// //   final String uId;
// //   final String orderID;

// //   const OrderEntity({
// //     required this.orderID,
// //     required this.uId,
// //     required this.userName,
// //     required this.cartEntity,
// //     required this.orderProducts,
// //     required this.totalPrice,
// //     required this.orderDate,
// //   });
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../Features/cart/domain/entites/cart_entity.dart';
// import 'order_product_entity.dart';

// class OrderEntity {
//   final double totalPrice;
//   final String userName;
//   final String userEmail;
//   final String? userImage;
//   final CartEntity cartEntity;
//   final List<OrderProductEntity> orderProducts;
//   final Timestamp orderDate;
//   final String uId;
//   final String orderID;

//   const OrderEntity({
//     required this.orderID,
//     required this.uId,
//     required this.userName,
//     required this.userEmail,
//     this.userImage,
//     required this.cartEntity,
//     required this.orderProducts,
//     required this.totalPrice,
//     required this.orderDate,
//   });
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/cart/domain/entites/cart_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final String orderID;
  final String uId;
  final String userName;
  final String userEmail;
  final String? userImage;
  final CartEntity? cartEntity;
  final List<OrderProductEntity> orderProducts;
  final double totalPrice;
  final Timestamp orderDate;

  const OrderEntity({
    required this.orderID,
    required this.uId,
    required this.userName,
    required this.userEmail,
    this.userImage,
    this.cartEntity,
    required this.orderProducts,
    required this.totalPrice,
    required this.orderDate,
  });
}
