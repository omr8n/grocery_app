// // // // import 'package:equatable/equatable.dart';

// // // // import '../../../../core/entites/product_entity.dart';

// // // // // ignore: must_be_immutable
// // // // class CartItemEntity extends Equatable {
// // // //   final String cartId;
// // // //   final ProductEntity productEntity;
// // // //   int quantity;

// // // //   CartItemEntity(
// // // //     this.quantity, {
// // // //     required this.cartId,
// // // //     required this.productEntity,
// // // //   });

// // // //   num calculateTotalPrice() {
// // // //     return productEntity.price * quantity;
// // // //   }

// // // //   CartItemEntity copyWith({int? quantity}) {
// // // //     return CartItemEntity(
// // // //       cartId: cartId,
// // // //       productEntity: productEntity,
// // // //       quantity ?? this.quantity,
// // // //     );
// // // //   }

// // // //   CartItemEntity increaseQuantity() {
// // // //     return copyWith(quantity: quantity + 1);
// // // //   }

// // // //   CartItemEntity decreaseQuantity() {
// // // //     return copyWith(quantity: quantity > 1 ? quantity - 1 : quantity);
// // // //   }

// // // //   @override
// // // //   List<Object?> get props => [cartId, productEntity, quantity];
// // // // }
// // // import 'package:equatable/equatable.dart';

// // // import '../../../../core/entites/product_entity.dart';
// // // // import '../../../../core/entities/product_entity.dart';

// // // // ignore: must_be_immutable
// // // class CartItemEntity extends Equatable {
// // //   final ProductEntity productEntity;
// // //   int quantity;

// // //   CartItemEntity({required this.productEntity, this.quantity = 0});

// // //   num calculateTotalPrice() {
// // //     return productEntity.price * quantity;
// // //   }

// // //   num calculateTotalWeight() {
// // //     return productEntity.unitAmount * quantity;
// // //   }

// // //   void increaseQuantity() {
// // //     if (quantity >= 1) {
// // //       quantity++;
// // //     }
// // //   }

// // //   void decreaseQuantity() {
// // //     if (quantity > 1) {
// // //       quantity--;
// // //     }
// // //   }

// // //   @override
// // //   List<Object?> get props => [productEntity];
// // // }

// // // // import 'package:equatable/equatable.dart';
// // // // import '../../../../core/entities/product_entity.dart';

// // // // class CartItemEntity extends Equatable {
// // // //   final ProductEntity productEntity;
// // // //   final int quantity;

// // // //   const CartItemEntity({required this.productEntity, this.quantity = 0});

// // // //   CartItemEntity increaseQuantity() {
// // // //     return CartItemEntity(productEntity: productEntity, quantity: quantity + 1);
// // // //   }

// // // //   CartItemEntity decreaseQuantity() {
// // // //     return CartItemEntity(
// // // //       productEntity: productEntity,
// // // //       quantity: quantity > 0 ? quantity - 1 : 0,
// // // //     );
// // // //   }

// // // //   num calculateTotalPrice() {
// // // //     return productEntity.price * quantity;
// // // //   }

// // // //   num calculateTotalWeight() {
// // // //     return productEntity.unitAmount * quantity;
// // // //   }

// // // //   @override
// // // //   List<Object?> get props => [productEntity, quantity];
// // // // }

// // import 'package:equatable/equatable.dart';

// // import '../../../../core/entities/product_entity.dart';

// // // ignore: must_be_immutable
// // class CartItemEntity extends Equatable {
// //   final ProductEntity productEntity;
// //   int quantity;

// //   CartItemEntity({required this.productEntity, this.quantity = 0});

// //   num calculateTotalPrice() {
// //     return productEntity.price * quantity;
// //   }

// //   num calculateTotalWeight() {
// //     return productEntity.unitAmount * quantity;
// //   }

// //   void increaseQuantity() {
// //     if (quantity >= 1) {
// //       quantity++;
// //     }
// //   }

// //   void decreaseQuantity() {
// //     if (quantity > 1) {
// //       quantity--;
// //     }
// //   }

// //   @override
// //   List<Object?> get props => [productEntity];
// // }

// // // import 'package:equatable/equatable.dart';
// // // import '../../../../core/entities/product_entity.dart';

// // // class CartItemEntity extends Equatable {
// // //   final ProductEntity productEntity;
// // //   final int quantity;

// // //   const CartItemEntity({required this.productEntity, this.quantity = 0});

// // //   CartItemEntity increaseQuantity() {
// // //     return CartItemEntity(productEntity: productEntity, quantity: quantity + 1);
// // //   }

// // //   CartItemEntity decreaseQuantity() {
// // //     return CartItemEntity(
// // //       productEntity: productEntity,
// // //       quantity: quantity > 0 ? quantity - 1 : 0,
// // //     );
// // //   }

// // //   num calculateTotalPrice() {
// // //     return productEntity.price * quantity;
// // //   }

// // //   num calculateTotalWeight() {
// // //     return productEntity.unitAmount * quantity;
// // //   }

// // //   @override
// // //   List<Object?> get props => [productEntity, quantity];
// // // }

// import 'package:equatable/equatable.dart';
// import '../../../../core/entites/product_entity.dart';

// class CartItemEntity extends Equatable {
//   final String cartId;
//   final ProductEntity productEntity;
//   final int quantity;

//   const CartItemEntity({
//     required this.cartId,
//     required this.productEntity,
//     this.quantity = 1,
//   });

//   num calculateTotalPrice() {
//     return productEntity.price * quantity;
//   }

//   CartItemEntity increaseQuantity() {
//     return CartItemEntity(
//       cartId: cartId,
//       productEntity: productEntity,
//       quantity: quantity + 1,
//     );
//   }

//   CartItemEntity decreaseQuantity() {
//     return CartItemEntity(
//       cartId: cartId,
//       productEntity: productEntity,
//       quantity: quantity > 1 ? quantity - 1 : 1,
//     );
//   }

//   @override
//   List<Object?> get props => [cartId, productEntity, quantity];
// }

import 'package:equatable/equatable.dart';
import '../../../../core/entites/product_entity.dart';
// import '../../../edit/domain/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final String cartId;
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity(
    this.quantity, {
    required this.cartId,
    required this.productEntity,
  });

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  CartItemEntity copyWith({int? quantity}) {
    return CartItemEntity(
      cartId: cartId,
      productEntity: productEntity,
      quantity ?? this.quantity,
    );
  }

  CartItemEntity increaseQuantity() {
    return copyWith(quantity: quantity + 1);
  }

  CartItemEntity decreaseQuantity() {
    return copyWith(quantity: quantity > 1 ? quantity - 1 : quantity);
  }

  @override
  List<Object?> get props => [cartId, productEntity, quantity];
}
