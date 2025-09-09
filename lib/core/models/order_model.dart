// // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import '../../Features/cart/domain/entites/cart_entity.dart';
// // // import '../entites/order_entity.dart';
// // import 'cart_model.dart';
// // import 'order_product_model.dart';
// // import '../entities/order_entity.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../entites/order_entity.dart';
// import 'cart_model.dart';
// import 'order_product_model.dart';

// // import '../entites/order_entity.dart';
// // import 'cart_model.dart';
// // import 'order_product_model.dart';

// class OrderModel {
//   final String orderID;
//   final String uId;
//   final String userName;
//   final String userEmail;
//   final String? userImage;
//   final CartModel cartModel;
//   final List<OrderProductModel> orderProducts;
//   final double totalPrice;
//   final Timestamp orderDate;
//   final String? status;

//   OrderModel({
//     required this.orderID,
//     required this.uId,
//     required this.userName,
//     required this.userEmail,
//     this.userImage,
//     required this.cartModel,
//     required this.orderProducts,
//     required this.totalPrice,
//     required this.orderDate,
//     this.status,
//   });
//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     try {
//       return OrderModel(
//         orderID: json['orderID'] ?? '',
//         uId: json['uId'] ?? '',
//         userName: json['userName'] ?? '',
//         userEmail: json['userEmail'] ?? '',
//         userImage: json['userImage'],
//         orderProducts: (json['orderProducts'] as List<dynamic>? ?? [])
//             .map((e) => OrderProductModel.fromJson(e))
//             .toList(),
//         cartModel: CartModel.fromJson(json['cartModel'] ?? {}),
//         orderDate: json['orderDate'] is Timestamp
//             ? json['orderDate']
//             : Timestamp.fromDate(
//                 DateTime.tryParse(json['orderDate'] ?? '') ?? DateTime.now(),
//               ),
//         totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
//         status: json['status'],
//       );
//     } catch (e) {
//       print("OrderModel.fromJson error: $e --- json: $json");
//       rethrow;
//     }
//   }

//   // factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//   //   totalPrice: (json['totalPrice'] as num).toDouble(),
//   //   uId: json['uId'],
//   //   userName: json['userName'],
//   //   userEmail: json['userEmail'],
//   //   userImage: json['userImage'],
//   //   orderProducts:
//   //       (json['orderProducts'] as List)
//   //           .map((e) => OrderProductModel.fromJson(e))
//   //           .toList(),
//   //   cartModel: CartModel.fromJson(json['cartModel']),
//   //   orderDate:
//   //       json['orderDate'] is Timestamp
//   //           ? json['orderDate']
//   //           : Timestamp.fromDate(DateTime.parse(json['orderDate'])),
//   //   orderID: json['orderID'],
//   //   status: json['status'],
//   // );

//   Map<String, dynamic> toJson() => {
//     'totalPrice': totalPrice,
//     'uId': uId,
//     'userName': userName,
//     'userEmail': userEmail,
//     'userImage': userImage,
//     'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
//     'cartModel': cartModel.toJson(),
//     'orderDate': orderDate,
//     'orderID': orderID,
//     'status': status ?? 'pending',
//   };

//   OrderEntity toEntity() => OrderEntity(
//     orderID: orderID,
//     uId: uId,
//     userName: userName,
//     userEmail: userEmail,
//     userImage: userImage,
//     cartEntity: cartModel.toEntity(),
//     orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
//     totalPrice: totalPrice,
//     orderDate: orderDate,
//   );

//   factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
//     orderID: orderEntity.orderID,
//     totalPrice: orderEntity.totalPrice,
//     uId: orderEntity.uId,
//     userName: orderEntity.userName,
//     userEmail: orderEntity.userEmail,
//     userImage: orderEntity.userImage,
//     cartModel: CartModel.fromEntity(orderEntity: orderEntity),
//     orderProducts: orderEntity.orderProducts
//         .map((e) => OrderProductModel.fromEntity(e))
//         .toList(),
//     orderDate: orderEntity.orderDate,
//   );
// }

// // class OrderModel {
// //   final String orderID;
// //   final String uId;
// //   final String userName;
// //   final CartModel cartModel;
// //   final List<OrderProductModel> orderProducts;
// //   final double totalPrice;
// //   final Timestamp orderDate;
// //   final String? status;

// //   OrderModel({
// //     required this.orderID,
// //     required this.uId,
// //     required this.userName,
// //     required this.cartModel,
// //     required this.orderProducts,
// //     required this.totalPrice,
// //     required this.orderDate,
// //     this.status,
// //   });

// //   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
// //     totalPrice: (json['totalPrice'] as num).toDouble(),
// //     uId: json['uId'],
// //     userName: json['userName'],
// //     orderProducts:
// //         (json['orderProducts'] as List)
// //             .map((e) => OrderProductModel.fromJson(e))
// //             .toList(),
// //     cartModel: CartModel.fromJson(json['cartModel']),
// //     orderDate:
// //         json['orderDate'] is Timestamp
// //             ? json['orderDate']
// //             : Timestamp.fromDate(DateTime.parse(json['orderDate'])),
// //     orderID: json['orderID'],
// //     status: json['status'],
// //   );

// //   Map<String, dynamic> toJson() => {
// //     'totalPrice': totalPrice,
// //     'uId': uId,
// //     'userName': userName,
// //     'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
// //     'cartModel': cartModel.toJson(),
// //     'orderDate': orderDate,
// //     'orderID': orderID,
// //     'status': status ?? 'pending',
// //   };

// //   OrderEntity toEntity() => OrderEntity(
// //     orderID: orderID,
// //     uId: uId,
// //     userName: userName,
// //     cartEntity: cartModel.toEntity(),
// //     orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
// //     totalPrice: totalPrice,
// //     orderDate: orderDate,
// //   );

// //   factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
// //     orderID: orderEntity.orderID,
// //     totalPrice: orderEntity.totalPrice,
// //     uId: orderEntity.uId,
// //     userName: orderEntity.userName,
// //     cartModel: CartModel.fromEntity(orderEntity.cartEntity),
// //     orderProducts:
// //         orderEntity.orderProducts
// //             .map((e) => OrderProductModel.fromEntity(e))
// //             .toList(),
// //     orderDate: orderEntity.orderDate,
// //   );
// // }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/core/entites/order_entity.dart';
import 'package:grocery_app/core/models/cart_model.dart';
// import '../entites/order_entity.dart';
// import 'cart_model.dart';
import 'order_product_model.dart';

class OrderModel {
  final String orderID;
  final String uId;
  final String userName;
  final String userEmail;
  final String? userImage;
  final CartModel cartModel;
  final List<OrderProductModel> orderProducts;
  final double totalPrice;
  final Timestamp orderDate;
  final String? status;

  const OrderModel({
    required this.orderID,
    required this.uId,
    required this.userName,
    required this.userEmail,
    this.userImage,
    required this.cartModel,
    required this.orderProducts,
    required this.totalPrice,
    required this.orderDate,
    this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json['orderID'] ?? '',
      uId: json['uId'] ?? '',
      userName: json['userName'] ?? '',
      userEmail: json['userEmail'] ?? '',
      userImage: json['userImage'],
      orderProducts: (json['orderProducts'] as List? ?? [])
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      cartModel: CartModel.fromJson(json['cartModel'] ?? {}),
      orderDate: json['orderDate'] is Timestamp
          ? json['orderDate']
          : Timestamp.fromDate(
              DateTime.tryParse(json['orderDate'] ?? '') ?? DateTime.now(),
            ),
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'orderID': orderID,
    'uId': uId,
    'userName': userName,
    'userEmail': userEmail,
    'userImage': userImage,
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'cartModel': cartModel.toJson(),
    'totalPrice': totalPrice,
    'orderDate': orderDate,
    'status': status ?? 'pending',
  };

  OrderEntity toEntity() => OrderEntity(
    orderID: orderID,
    uId: uId,
    userName: userName,
    userEmail: userEmail,
    userImage: userImage,
    cartEntity: cartModel.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    totalPrice: totalPrice,
    orderDate: orderDate,
  );

  factory OrderModel.fromEntity(OrderEntity entity) => OrderModel(
    orderID: entity.orderID,
    uId: entity.uId,
    userName: entity.userName,
    userEmail: entity.userEmail,
    userImage: entity.userImage,
    cartModel: CartModel.fromEntity(entity.cartEntity),
    orderProducts: entity.orderProducts
        .map((e) => OrderProductModel.fromEntity(e))
        .toList(),
    totalPrice: entity.totalPrice,
    orderDate: entity.orderDate,
  );
}
