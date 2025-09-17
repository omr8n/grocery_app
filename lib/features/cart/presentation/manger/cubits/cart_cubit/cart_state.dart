// // part of 'cart_cubit.dart';

// // abstract class CartState {}

// // class CartInitial extends CartState {}

// // class CartItemAdded extends CartState {
// //   final CartItemEntity cartItem;
// //   final String message;

// //   CartItemAdded(this.cartItem, this.message);
// // }

// // class CartItemUpdated extends CartState {
// //   final CartItemEntity cartItem;
// //   final String message;

// //   CartItemUpdated(this.cartItem, this.message);
// // }

// // class CartItemRemoved extends CartState {
// //   final CartItemEntity cartItem;
// //   final String message;

// //   CartItemRemoved(this.cartItem, this.message);
// // }

// // class CartCleared extends CartState {}

// // class CartAuthRequired extends CartState {}

// // class CartSyncError extends CartState {
// //   final String message;

// //   CartSyncError(this.message);
// // }
// part of 'cart_cubit.dart';

// abstract class CartState {}

// class CartInitial extends CartState {}

// class CartItemAdded extends CartState {
//   final CartItemEntity cartItem;
//   // final String message;
//   CartItemAdded(this.cartItem);
// }

// class CartItemUpdated extends CartState {
//   final CartItemEntity cartItem;
//   // final String message;
//   CartItemUpdated(this.cartItem);
// }

// class CartItemRemoved extends CartState {
//   final CartItemEntity cartItem;
//   // final String message;
//   CartItemRemoved(this.cartItem);
// }

// class CartCleared extends CartState {}

// class CartAuthRequired extends CartState {}

// class CartSyncError extends CartState {
//   final String message;

//   CartSyncError(this.message);
// }
part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final CartEntity cartEntity;
  CartLoaded(this.cartEntity);
}

class CartItemAdded extends CartState {
  final CartItemEntity cartItem;
  CartItemAdded(this.cartItem);
}

class CartItemUpdated extends CartState {
  final CartItemEntity cartItem;
  CartItemUpdated(this.cartItem);
}

class CartItemRemoved extends CartState {
  final CartItemEntity cartItem;
  CartItemRemoved(this.cartItem);
}

class CartCleared extends CartState {}

class CartAuthRequired extends CartState {}

class CartSyncError extends CartState {
  final String message;
  CartSyncError(this.message);
}
