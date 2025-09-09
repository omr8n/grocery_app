// // // part of 'orders_cubit.dart';

// // // abstract class OrdersState {}

// // // class OrdersInitial extends OrdersState {}

// // // class OrdersLoading extends OrdersState {}

// // // class OrdersLoaded extends OrdersState {
// // //   final List<OrderModel> orders;
// // //   OrdersLoaded(this.orders);
// // // }

// // // class OrdersError extends OrdersState {
// // //   final String message;
// // //   OrdersError(this.message);
// // // }

// // // class OrderAdding extends OrdersState {}

// // part of 'orders_cubit.dart';

// // abstract class OrdersState {}

// // class OrdersInitial extends OrdersState {}

// // class OrdersLoading extends OrdersState {}

// // class OrdersSuccess extends OrdersState {
// //   final List<OrderEntity> orders;
// //   OrdersSuccess(this.orders);
// // }

// // class OrdersError extends OrdersState {
// //   final String message;
// //   OrdersError(this.message);
// // }

// // class OrderAdding extends OrdersState {}

// import '../../entities/order_entity.dart';

// abstract class OrdersState {}

// class OrdersInitial extends OrdersState {}

// class OrdersLoading extends OrdersState {}

// class OrdersSuccess extends OrdersState {
//   final List<OrderEntity> orders;
//   OrdersSuccess({required this.orders});
// }

// class OrdersError extends OrdersState {
//   final String message;
//   OrdersError(this.message);
// }

// class OrderAdding extends OrdersState {}
import '../../entites/order_entity.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class UserOrdersLoaded extends OrdersState {
  final List<OrderEntity> orders;
  UserOrdersLoaded(this.orders);
}

class AllOrderSuccess extends OrdersState {
  final List<OrderEntity> orders;
  AllOrderSuccess(this.orders);
}

class OrdersError extends OrdersState {
  final String message;
  OrdersError(this.message);
}

class OrderAdding extends OrdersState {}

class OrderAddedSuccess extends OrdersState {}

class OrderAddingError extends OrdersState {
  final String message;
  OrderAddingError(this.message);
}
