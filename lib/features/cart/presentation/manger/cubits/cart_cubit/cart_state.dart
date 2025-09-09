// part of 'cart_cubit.dart';

// import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';

// @immutable
// abstract class CartState {}

// class CartInitial extends CartState {}

// class CartItemAdded extends CartState {
//   final CartItemEntity cartItem;
//   final String message;

//   CartItemAdded(this.cartItem, this.message);
// }

// class CartItemUpdated extends CartState {
//   final CartItemEntity cartItem;
//   final String message;

//   CartItemUpdated(this.cartItem, this.message);
// }

// class CartItemRemoved extends CartState {
//   final CartItemEntity cartItem;
//   final String message;

//   CartItemRemoved(this.cartItem, this.message);
// }

// class CartCleared extends CartState {}

// class CartAuthRequired extends CartState {}

// class CartSyncError extends CartState {
//   final String message;

//   CartSyncError(this.message);
// }

// // import '../../../../domain/entites/cart_entity.dart';

// // abstract class CartState {}

// // class CartInitial extends CartState {}

// // class CartUpdated extends CartState {
// //   final CartEntity cart;
// //   final String? message;
// //   CartUpdated(this.cart, {this.message});
// // }

// // class CartAuthRequired extends CartState {}

// // class CartSyncError extends CartState {
// //   final String error;
// //   CartSyncError(this.error);
// // }

part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartItemAdded extends CartState {
  final CartItemEntity cartItem;
  final String message;

  CartItemAdded(this.cartItem, this.message);
}

class CartItemUpdated extends CartState {
  final CartItemEntity cartItem;
  final String message;

  CartItemUpdated(this.cartItem, this.message);
}

class CartItemRemoved extends CartState {
  final CartItemEntity cartItem;
  final String message;

  CartItemRemoved(this.cartItem, this.message);
}

class CartCleared extends CartState {}

class CartAuthRequired extends CartState {}

class CartSyncError extends CartState {
  final String message;

  CartSyncError(this.message);
}
