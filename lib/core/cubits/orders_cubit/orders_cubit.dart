import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';

// import '../../../Features/cart/domain/entites/cart_entity.dart';

import '../../../features/inner_screens/auth/domain/entites/user_entity.dart';
import '../../entites/order_entity.dart';
import '../../entites/order_product_entity.dart';
import '../../models/order_model.dart';
import '../../repos/order_repo/order_repo.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  StreamSubscription? _streamSubscription;

  void fetchUserOrders() {
    emit(OrdersLoading());

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      emit(OrdersError('المستخدم غير مسجل الدخول'));
      return;
    }

    _streamSubscription = ordersRepo.fetchOrders(userId).listen((result) {
      result.fold(
        (failure) {
          emit(OrdersError(failure.message));
        },
        (ordersList) {
          emit(UserOrdersLoaded(ordersList));
        },
      );
    });
  }

  void fetchAllOrders() {
    emit(OrdersLoading());
    _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
      result.fold(
        (f) {
          emit(OrdersError(f.message));
        },
        (r) {
          emit(AllOrderSuccess(r));
        },
      );
    });
  }
  // void fetchAllOrders() {
  //   emit(OrdersLoading());

  //   _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
  //     result.fold(
  //       (failure) {
  //         emit(OrdersError(failure.message));
  //       },
  //       (ordersList) {
  //         emit(AllOrdersLoaded(ordersList));
  //       },
  //     );
  //   });
  // }

  Future<void> addOrder({
    required CartEntity cartEntity,
    required List<OrderProductEntity> orderProducts,
    required double totalPrice,
    required UserEntity userEntity,
  }) async {
    emit(OrderAdding());

    final order = OrderEntity(
      orderID: await ordersRepo.generateOrderId(),
      uId: userEntity.uId,
      userName: userEntity.name,
      userEmail: userEntity.email,
      //  userImage: userEntity.userImage,
      cartEntity: cartEntity,
      orderProducts: orderProducts,
      totalPrice: totalPrice,
      orderDate: Timestamp.now(),
    );

    final result = await ordersRepo.addOrder(order: order);

    result.fold(
      (failure) => emit(OrderAddingError(failure.message)),
      (_) => emit(OrderAddedSuccess()),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
