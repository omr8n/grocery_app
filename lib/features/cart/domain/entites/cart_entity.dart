// // import 'package:equatable/equatable.dart';
// // // import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// // import 'package:grocery_app/core/entites/product_entity.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';

// // // import 'cart_item_entity.dart';
// // // import 'cart_item_entity.dart';
// // // import '../../../edit/domain/entities/product_entity.dart';

// // class CartEntity extends Equatable {
// //   final List<CartItemEntity> cartItems;

// //   const CartEntity(this.cartItems);

// //   double calculateTotalPrice() {
// //     return cartItems.fold(0.0, (sum, item) => sum + item.calculateTotalPrice());
// //   }

// //   bool isExist(ProductEntity product) {
// //     return cartItems.any(
// //       (item) => item.productEntity.productId == product.productId,
// //     );
// //   }

// //   CartItemEntity getCartItem(ProductEntity product) {
// //     return cartItems.firstWhere(
// //       (item) => item.productEntity.productId == product.productId,
// //       orElse: () => CartItemEntity(productEntity: product, 1, cartId: ''),
// //     );
// //   }

// //   void addCartItem(CartItemEntity cartItemEntity) {
// //     cartItems.add(cartItemEntity);
// //   }

// //   void removeCartItem(CartItemEntity carItem) {
// //     cartItems.remove(carItem);
// //   }

// //   CartEntity updateCartItem(CartItemEntity updatedItem) {
// //     return CartEntity(
// //       cartItems
// //           .map((e) => e.cartId == updatedItem.cartId ? updatedItem : e)
// //           .toList(),
// //     );
// //   }

// //   @override
// //   List<Object?> get props => [cartItems];
// // }
// import 'package:equatable/equatable.dart';
// import 'cart_item_entity.dart';
// import '../../../../core/entites/product_entity.dart';

// class CartEntity extends Equatable {
//   final List<CartItemEntity> cartItems;

//   const CartEntity(this.cartItems);

//   double calculateTotalPrice() =>
//       cartItems.fold(0.0, (sum, item) => sum + item.calculateTotalPrice());

//   bool isExist(ProductEntity product) => cartItems.any(
//     (item) => item.productEntity.productId == product.productId,
//   );

//   CartItemEntity getCartItem(ProductEntity product) {
//     return cartItems.firstWhere(
//       (item) => item.productEntity.productId == product.productId,
//       orElse: () =>
//           CartItemEntity(cartId: '', productEntity: product, quantity: 1),
//     );
//   }

//   CartEntity addCartItem(CartItemEntity cartItemEntity) {
//     return CartEntity([...cartItems, cartItemEntity]);
//   }

//   CartEntity removeCartItem(CartItemEntity cartItem) {
//     return CartEntity(
//       cartItems.where((item) => item.cartId != cartItem.cartId).toList(),
//     );
//   }

//   CartEntity updateCartItem(CartItemEntity updatedItem) {
//     return CartEntity(
//       cartItems
//           .map((item) => item.cartId == updatedItem.cartId ? updatedItem : item)
//           .toList(),
//     );
//   }

//   @override
//   List<Object?> get props => [cartItems];
// }

import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:uuid/uuid.dart';
import 'cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> cartItems;

  const CartEntity(this.cartItems);

  double calculateTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item.calculateTotalPrice());
  }

  // bool isExist(ProductEntity product) {
  //   return cartItems.any(
  //     (item) => item.productEntity.productId == product.productId,
  //   );
  // }

  // CartItemEntity getCartItem(ProductEntity product) {
  //   return cartItems.firstWhere(
  //     (item) => item.productEntity.productId == product.productId,
  //     orElse: () => CartItemEntity(productEntity: product, 1, cartId: ''),
  //   );
  // }
  bool isExist(ProductEntity product) {
    return cartItems.any(
      (item) => item.productEntity.productId == product.productId,
    );
  }

  CartItemEntity getCartItem(ProductEntity product) {
    return cartItems.firstWhere(
      (item) => item.productEntity.productId == product.productId,
      orElse: () =>
          CartItemEntity(1, cartId: const Uuid().v4(), productEntity: product),
    );
  }

  CartEntity addCartItem(CartItemEntity item) {
    return CartEntity([...cartItems, item]);
  }

  CartEntity removeCartItem(CartItemEntity item) {
    return CartEntity(cartItems.where((e) => e.cartId != item.cartId).toList());
  }

  CartEntity updateCartItem(CartItemEntity updatedItem) {
    return CartEntity(
      cartItems
          .map((e) => e.cartId == updatedItem.cartId ? updatedItem : e)
          .toList(),
    );
  }

  @override
  List<Object?> get props => [cartItems];
}
