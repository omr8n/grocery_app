// import 'package:equatable/equatable.dart';
// import '../../../../core/entites/product_entity.dart';
// // import '../../../edit/domain/entities/product_entity.dart';

// // ignore: must_be_immutable
// class CartItemEntity extends Equatable {
//   final String cartId;
//   final ProductEntity productEntity;
//   int quantity;

//   CartItemEntity(
//     this.quantity, {
//     required this.cartId,
//     required this.productEntity,
//   });

//   num calculateTotalPrice() {
//     return productEntity.price * quantity;
//   }

//   CartItemEntity copyWith({int? quantity}) {
//     return CartItemEntity(
//       cartId: cartId,
//       productEntity: productEntity,
//       quantity ?? this.quantity,
//     );
//   }

//   CartItemEntity increaseQuantity() {
//     return copyWith(quantity: quantity + 1);
//   }

//   CartItemEntity decreaseQuantity() {
//     return copyWith(quantity: quantity > 1 ? quantity - 1 : quantity);
//   }

//   @override
//   List<Object?> get props => [cartId, productEntity, quantity];
// }

import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
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
