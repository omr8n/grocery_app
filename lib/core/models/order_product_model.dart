// // import '../../Features/cart/domain/entites/cart_item_entity.dart';
// // import '../entities/order_product_entity.dart';

// // class OrderProductModel {
// //   final String name;

// //   final String imageUrl;
// //   final double price;
// //   final int quantity;

// //   OrderProductModel({
// //     required this.name,

// //     required this.imageUrl,
// //     required this.price,
// //     required this.quantity,
// //   });

// //   factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
// //       OrderProductModel(
// //         name: json['name'],

// //         imageUrl: json['imageUrl'],
// //         price: (json['price'] as num).toDouble(),
// //         quantity: json['quantity'],
// //       );

// //   Map<String, dynamic> toJson() => {
// //     'name': name,

// //     'imageUrl': imageUrl,
// //     'price': price,
// //     'quantity': quantity,
// //   };

// //   OrderProductEntity toEntity() => OrderProductEntity(
// //     name: name,

// //     imageUrl: imageUrl,
// //     price: price,
// //     quantity: quantity,
// //   );

// //   factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) =>
// //       OrderProductModel(
// //         name: cartItemEntity.productEntity.name ?? '',

// //         imageUrl: cartItemEntity.productEntity.imageUrl ?? '',
// //         price: cartItemEntity.productEntity.price.toDouble(),
// //         quantity: cartItemEntity.quantity,
// //       );
// // }

// import '../entites/order_product_entity.dart';
// // import '../entities/order_product_entity.dart';

// class OrderProductModel {
//   final String name;

//   final String imageUrl;
//   final double price;
//   final int quantity;

//   OrderProductModel({
//     required this.name,

//     required this.imageUrl,
//     required this.price,
//     required this.quantity,
//   });

//   factory OrderProductModel.fromJson(Map<String, dynamic> json) {
//     return OrderProductModel(
//       name: json['name'],

//       imageUrl: json['imageUrl'],
//       price: (json['price'] as num).toDouble(),
//       quantity: json['quantity'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,

//       'imageUrl': imageUrl,
//       'price': price,
//       'quantity': quantity,
//     };
//   }

//   OrderProductEntity toEntity() {
//     return OrderProductEntity(
//       name: name,

//       imageUrl: imageUrl,
//       price: price,
//       quantity: quantity,
//     );
//   }

//   factory OrderProductModel.fromEntity(OrderProductEntity entity) {
//     return OrderProductModel(
//       name: entity.name,

//       imageUrl: entity.imageUrl,
//       price: entity.price,
//       quantity: entity.quantity,
//     );
//   }
// }
import '../entites/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  const OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }

  factory OrderProductModel.fromEntity(OrderProductEntity entity) {
    return OrderProductModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      quantity: entity.quantity,
    );
  }
}
