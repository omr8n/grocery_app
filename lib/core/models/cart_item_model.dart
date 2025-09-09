// // // // // // import '../../features/cart/domain/entites/cart_item_entity.dart';
// // // // // // import '../entites/product_entity.dart';

// // // // // // class CartItemModel {
// // // // // //   final String cartId;
// // // // // //   final String productId;
// // // // // //   final String? imageUrl;
// // // // // //   final String? name;
// // // // // //   final String? code;
// // // // // //   final double? price;
// // // // // //   final int quantity;

// // // // // //   CartItemModel({
// // // // // //     required this.cartId,
// // // // // //     required this.productId,
// // // // // //     this.imageUrl,
// // // // // //     this.name,
// // // // // //     this.code,
// // // // // //     this.price,
// // // // // //     required this.quantity,
// // // // // //   });

// // // // // //   CartItemEntity toEntity() {
// // // // // //     return CartItemEntity(
// // // // // //       cartId: cartId,
// // // // // //       productEntity: ProductEntity(
// // // // // //         productId: productId,
// // // // // //         imageUrl: imageUrl,
// // // // // //         name: name ?? '',
// // // // // //         description: '',
// // // // // //         price: price ?? 0,
// // // // // //         quantity: quantity.toString(),
// // // // // //         reviews: [],
// // // // // //         category: '',
// // // // // //         salePrice: 0, // قيمة افتراضية
// // // // // //         isOnSale: false, // قيمة افتراضية
// // // // // //         isPiece: true, // قيمة افتراضية
// // // // // //       ),
// // // // // //       quantity,
// // // // // //     );
// // // // // //   }

// // // // // //   factory CartItemModel.fromEntity(CartItemEntity entity) {
// // // // // //     final p = entity.productEntity;
// // // // // //     return CartItemModel(
// // // // // //       cartId: entity.cartId,
// // // // // //       productId: p.productId,
// // // // // //       imageUrl: p.imageUrl,
// // // // // //       name: p.name,
// // // // // //       price: p.price.toDouble(),
// // // // // //       quantity: entity.quantity,
// // // // // //     );
// // // // // //   }

// // // // // //   Map<String, dynamic> toJson() {
// // // // // //     return {
// // // // // //       'cartId': cartId,
// // // // // //       'productId': productId,
// // // // // //       'imageUrl': imageUrl,
// // // // // //       'name': name,
// // // // // //       'code': code,
// // // // // //       'price': price,
// // // // // //       'quantity': quantity,
// // // // // //     };
// // // // // //   }

// // // // // //   factory CartItemModel.fromJson(Map<String, dynamic> json) {
// // // // // //     return CartItemModel(
// // // // // //       cartId: json['cartId'],
// // // // // //       productId: json['productId'],
// // // // // //       imageUrl: json['imageUrl'],
// // // // // //       name: json['name'],
// // // // // //       code: json['code'],
// // // // // //       price: (json['price'] as num?)?.toDouble(),
// // // // // //       quantity: json['quantity'],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import '../../features/cart/domain/entites/cart_item_entity.dart';
// // // // // import '../entites/product_entity.dart';

// // // // // class CartItemModel {
// // // // //   final String cartId;
// // // // //   final String productId;
// // // // //   final String? imageUrl;
// // // // //   final String? name;
// // // // //   final String? code;
// // // // //   final double? price;
// // // // //   final int quantity;

// // // // //   CartItemModel({
// // // // //     required this.cartId,
// // // // //     required this.productId,
// // // // //     this.imageUrl,
// // // // //     this.name,
// // // // //     this.code,
// // // // //     this.price,
// // // // //     required this.quantity,
// // // // //   });

// // // // //   CartItemEntity toEntity() {
// // // // //     return CartItemEntity(
// // // // //       cartId: cartId,
// // // // //       productEntity: ProductEntity(
// // // // //         productId: productId,
// // // // //         imageUrl: imageUrl,
// // // // //         name: name ?? '',
// // // // //         description: '',
// // // // //         price: price ?? 0,
// // // // //         quantity: quantity.toString(),
// // // // //         reviews: [],
// // // // //         category: '',
// // // // //         salePrice: 0,
// // // // //         isOnSale: false,
// // // // //         isPiece: true,
// // // // //       ),
// // // // //       quantity,
// // // // //     );
// // // // //   }

// // // // //   factory CartItemModel.fromEntity(CartItemEntity entity) {
// // // // //     final p = entity.productEntity;
// // // // //     return CartItemModel(
// // // // //       cartId: entity.cartId,
// // // // //       productId: p.productId,
// // // // //       imageUrl: p.imageUrl,
// // // // //       name: p.name,
// // // // //       // code: p.code,
// // // // //       price: p.price.toDouble(),
// // // // //       quantity: entity.quantity,
// // // // //     );
// // // // //   }

// // // // //   Map<String, dynamic> toJson() {
// // // // //     return {
// // // // //       'cartId': cartId,
// // // // //       'productId': productId,
// // // // //       'imageUrl': imageUrl,
// // // // //       'name': name,
// // // // //       'code': code,
// // // // //       'price': price,
// // // // //       'quantity': quantity,
// // // // //     };
// // // // //   }

// // // // //   factory CartItemModel.fromJson(Map<String, dynamic> json) {
// // // // //     return CartItemModel(
// // // // //       cartId: json['cartId'],
// // // // //       productId: json['productId'],
// // // // //       imageUrl: json['imageUrl'],
// // // // //       name: json['name'],
// // // // //       code: json['code'],
// // // // //       price: (json['price'] as num?)?.toDouble(),
// // // // //       quantity: json['quantity'],
// // // // //     );
// // // // //   }
// // // // // }
// // // // import '../../features/cart/domain/entites/cart_item_entity.dart';
// // // // import '../entites/product_entity.dart';

// // // // class CartItemModel {
// // // //   final String cartId;
// // // //   final String productId;
// // // //   final String? imageUrl;
// // // //   final String? name;
// // // //   final double? price;
// // // //   final int quantity;

// // // //   const CartItemModel({
// // // //     required this.cartId,
// // // //     required this.productId,
// // // //     this.imageUrl,
// // // //     this.name,
// // // //     this.price,
// // // //     required this.quantity,
// // // //   });

// // // //   CartItemEntity toEntity() {
// // // //     return CartItemEntity(
// // // //       cartId: cartId,
// // // //       productEntity: ProductEntity(
// // // //         productId: productId,
// // // //         name: name ?? '',
// // // //         description: '',
// // // //         price: price ?? 0,
// // // //         quantity: quantity.toString(),
// // // //         category: '',
// // // //         reviews: const [],
// // // //         salePrice: 0,
// // // //         isOnSale: false,
// // // //         isPiece: true,
// // // //         imageUrl: imageUrl,
// // // //       ),
// // // //       quantity: quantity,
// // // //     );
// // // //   }

// // // //   factory CartItemModel.fromEntity(CartItemEntity entity) {
// // // //     final p = entity.productEntity;
// // // //     return CartItemModel(
// // // //       cartId: entity.cartId,
// // // //       productId: p.productId,
// // // //       imageUrl: p.imageUrl,
// // // //       name: p.name,
// // // //       price: p.price.toDouble(),
// // // //       quantity: entity.quantity,
// // // //     );
// // // //   }

// // // //   Map<String, dynamic> toJson() {
// // // //     return {
// // // //       'cartId': cartId,
// // // //       'productId': productId,
// // // //       'imageUrl': imageUrl,
// // // //       'name': name,
// // // //       'price': price,
// // // //       'quantity': quantity,
// // // //     };
// // // //   }

// // // //   factory CartItemModel.fromJson(Map<String, dynamic> json) {
// // // //     return CartItemModel(
// // // //       cartId: json['cartId'] ?? '',
// // // //       productId: json['productId'] ?? '',
// // // //       imageUrl: json['imageUrl'],
// // // //       name: json['name'],
// // // //       price: (json['price'] as num?)?.toDouble(),
// // // //       quantity: json['quantity'] ?? 1,
// // // //     );
// // // //   }
// // // // }
// // // import '../../Features/cart/domain/entites/cart_item_entity.dart';
// // // import '../../Features/edit/domain/entities/product_entity.dart';

// // // class CartItemModel {
// // //   final String cartId;
// // //   final String productId;
// // //   final String? imageUrl;
// // //   final String? name;
// // //   final String? code;
// // //   final double? price;
// // //   final int quantity;

// // //   CartItemModel({
// // //     required this.cartId,
// // //     required this.productId,
// // //     this.imageUrl,
// // //     this.name,
// // //     this.code,
// // //     this.price,
// // //     required this.quantity,
// // //   });

// // //   CartItemEntity toEntity() {
// // //     return CartItemEntity(
// // //       cartId: cartId,
// // //       productEntity: ProductEntity(
// // //         productId: productId,
// // //         imageUrl: imageUrl,
// // //         name: name ?? '',
// // //         description: '',
// // //         price: price ?? 0,
// // //         quantity: quantity.toString(),
// // //         reviews: [],
// // //         category: '',
// // //       ),
// // //       quantity,
// // //     );
// // //   }

// // //   factory CartItemModel.fromEntity(CartItemEntity entity) {
// // //     final p = entity.productEntity;
// // //     return CartItemModel(
// // //       cartId: entity.cartId,
// // //       productId: p.productId,
// // //       imageUrl: p.imageUrl,
// // //       name: p.name,
// // //       price: p.price.toDouble(),
// // //       quantity: entity.quantity,
// // //     );
// // //   }

// // //   Map<String, dynamic> toJson() {
// // //     return {
// // //       'cartId': cartId,
// // //       'productId': productId,
// // //       'imageUrl': imageUrl,
// // //       'name': name,
// // //       'code': code,
// // //       'price': price,
// // //       'quantity': quantity,
// // //     };
// // //   }

// // //   factory CartItemModel.fromJson(Map<String, dynamic> json) {
// // //     return CartItemModel(
// // //       cartId: json['cartId'],
// // //       productId: json['productId'],
// // //       imageUrl: json['imageUrl'],
// // //       name: json['name'],
// // //       code: json['code'],
// // //       price: (json['price'] as num?)?.toDouble(),
// // //       quantity: json['quantity'],
// // //     );
// // //   }
// // // }

// // import 'package:grocery_app/core/entites/product_entity.dart';

// // import '../../Features/cart/domain/entites/cart_item_entity.dart';
// // // import '../../Features/edit/domain/entities/product_entity.dart';

// // class CartItemModel {
// //   final String cartId;
// //   final String productId;
// //   final String? imageUrl;
// //   final String? name;
// //   final String? code;
// //   final double? price;
// //   final int quantity;

// //   CartItemModel({
// //     required this.cartId,
// //     required this.productId,
// //     this.imageUrl,
// //     this.name,
// //     this.code,
// //     this.price,
// //     required this.quantity,
// //   });

// //   CartItemEntity toEntity() {
// //     return CartItemEntity(
// //       cartId: cartId,
// //       productEntity: ProductEntity(
// //         productId: productId,
// //         imageUrl: imageUrl,
// //         name: name ?? '',
// //         description: '',
// //         price: price ?? 0,
// //         quantity: quantity.toString(),
// //         reviews: [],
// //         category: '',
// //         salePrice: 2,
// //         isOnSale: true,
// //         isPiece: true,
// //       ),
// //       quantity,
// //     );
// //   }

// //   factory CartItemModel.fromEntity(CartItemEntity entity) {
// //     final p = entity.productEntity;
// //     return CartItemModel(
// //       cartId: entity.cartId,
// //       productId: p.productId,
// //       imageUrl: p.imageUrl,
// //       name: p.name,
// //       price: p.price.toDouble(),
// //       quantity: entity.quantity,
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'cartId': cartId,
// //       'productId': productId,
// //       'imageUrl': imageUrl,
// //       'name': name,
// //       'code': code,
// //       'price': price,
// //       'quantity': quantity,
// //     };
// //   }

// //   factory CartItemModel.fromJson(Map<String, dynamic> json) {
// //     return CartItemModel(
// //       cartId: json['cartId'],
// //       productId: json['productId'],
// //       imageUrl: json['imageUrl'],
// //       name: json['name'],
// //       code: json['code'],
// //       price: (json['price'] as num?)?.toDouble(),
// //       quantity: json['quantity'],
// //     );
// //   }
// // }
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';

// class CartItemModel {
//   final String cartId;
//   final String productId;
//   final String? imageUrl;
//   final String? name;
//   final String? code;
//   final double? price;
//   final int quantity;
//   final double salePrice;
//   final bool isOnSale;
//   final bool isPiece;
//   final String category;

//   CartItemModel({
//     required this.cartId,
//     required this.productId,
//     this.imageUrl,
//     this.name,
//     this.code,
//     this.price,
//     required this.quantity,
//     this.salePrice = 0,
//     this.isOnSale = false,
//     this.isPiece = true,
//     this.category = '',
//   });

//   CartItemEntity toEntity() {
//     return CartItemEntity(
//       cartId: cartId,
//       productEntity: ProductEntity(
//         productId: productId,
//         imageUrl: imageUrl,
//         name: name ?? '',
//         description: '',
//         price: price ?? 0,
//         quantity: quantity.toString(),
//         reviews: [],
//         category: category,
//         salePrice: salePrice,
//         isOnSale: isOnSale,
//         isPiece: isPiece,
//       ),
//       quantity,
//     );
//   }

//   factory CartItemModel.fromEntity(CartItemEntity entity) {
//     final p = entity.productEntity;
//     return CartItemModel(
//       cartId: entity.cartId,
//       productId: p.productId,
//       imageUrl: p.imageUrl,
//       name: p.name,
//       price: p.price.toDouble(),
//       quantity: entity.quantity,
//       salePrice: p.salePrice,
//       isOnSale: p.isOnSale,
//       isPiece: p.isPiece,
//       category: p.category,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'cartId': cartId,
//     'productId': productId,
//     'imageUrl': imageUrl,
//     'name': name,
//     'code': code,
//     'price': price,
//     'quantity': quantity,
//     'salePrice': salePrice,
//     'isOnSale': isOnSale,
//     'isPiece': isPiece,
//     'category': category,
//   };

//   factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
//     cartId: json['cartId'],
//     productId: json['productId'],
//     imageUrl: json['imageUrl'],
//     name: json['name'],
//     code: json['code'],
//     price: (json['price'] as num?)?.toDouble(),
//     quantity: json['quantity'],
//     salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0,
//     isOnSale: json['isOnSale'] ?? false,
//     isPiece: json['isPiece'] ?? true,
//     category: json['category'] ?? '',
//   );
// }
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';

class CartItemModel {
  final String cartId;
  final String productId;
  final String? imageUrl;
  final String? name;
  final String? code;
  final double? price;
  final int quantity;
  final double salePrice;
  final bool isOnSale;
  final bool isPiece;
  final String category;

  CartItemModel({
    required this.cartId,
    required this.productId,
    this.imageUrl,
    this.name,
    this.code,
    this.price,
    required this.quantity,
    this.salePrice = 0,
    this.isOnSale = false,
    this.isPiece = true,
    this.category = '',
  });

  CartItemEntity toEntity() {
    return CartItemEntity(
      cartId: cartId,
      productEntity: ProductEntity(
        productId: productId,
        imageUrl: imageUrl,
        name: name ?? '',
        description: '',
        price: price ?? 0,
        quantity: quantity.toString(),
        reviews: [],
        category: category,
        salePrice: salePrice,
        isOnSale: isOnSale,
        isPiece: isPiece,
      ),
      quantity,
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    final p = entity.productEntity;
    return CartItemModel(
      cartId: entity.cartId,
      productId: p.productId,
      imageUrl: p.imageUrl,
      name: p.name,
      price: p.price.toDouble(),
      quantity: entity.quantity,
      salePrice: p.salePrice,
      isOnSale: p.isOnSale,
      isPiece: p.isPiece,
      category: p.category,
    );
  }

  Map<String, dynamic> toJson() => {
    'cartId': cartId,
    'productId': productId,
    'imageUrl': imageUrl,
    'name': name,
    'code': code,
    'price': price,
    'quantity': quantity,
    'salePrice': salePrice,
    'isOnSale': isOnSale,
    'isPiece': isPiece,
    'category': category,
  };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    cartId: json['cartId'],
    productId: json['productId'],
    imageUrl: json['imageUrl'],
    name: json['name'],
    code: json['code'],
    price: (json['price'] as num?)?.toDouble(),
    quantity: json['quantity'],
    salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0,
    isOnSale: json['isOnSale'] ?? false,
    isPiece: json['isPiece'] ?? true,
    category: json['category'] ?? '',
  );
}
