import 'dart:async';
// import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/models/order_model.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';

// import '../../../Features/cart/domain/entites/cart_entity.dart';

import '../../../features/inner_screens/auth/domain/entites/user_entity.dart';
import '../../entites/order_entity.dart';
import '../../entites/order_product_entity.dart';
// import '../../models/order_model.dart';
import '../../repos/order_repo/order_repo.dart';
import 'orders_state.dart';

// class OrdersCubit extends Cubit<OrdersState> {
//   final OrdersRepo ordersRepo;

//   OrdersCubit(this.ordersRepo) : super(OrdersInitial());

//   StreamSubscription? _streamSubscription;
//   static List<OrderModel> _orders = [];
//   List<OrderModel> get getOrders {
//     return _orders;
//   }

//   void fetchUserOrders() {
//     emit(OrdersLoading());

//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) {
//       emit(OrdersError('المستخدم غير مسجل الدخول'));
//       return;
//     }

//     _streamSubscription = ordersRepo.fetchOrders(userId).listen((result) {
//       result.fold(
//         (failure) {
//           emit(OrdersError(failure.message));
//         },
//         (ordersList) {
//           emit(UserOrdersLoaded(ordersList));
//         },
//       );
//     });
//   }

//   void clearOrders() {
//     _orders = [];
//     emit(OrdersInitial());
//   }

//   void fetchAllOrders() {
//     emit(OrdersLoading());
//     _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
//       result.fold(
//         (f) {
//           emit(OrdersError(f.message));
//         },
//         (r) {
//           emit(AllOrderSuccess(r));
//         },
//       );
//     });
//   }
//   // void fetchAllOrders() {
//   //   emit(OrdersLoading());

//   //   _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
//   //     result.fold(
//   //       (failure) {
//   //         emit(OrdersError(failure.message));
//   //       },
//   //       (ordersList) {
//   //         emit(AllOrdersLoaded(ordersList));
//   //       },
//   //     );
//   //   });
//   // }

//   // Future<void> addOrder({
//   //   required CartEntity cartEntity,
//   //   required List<OrderProductEntity> orderProducts,
//   //   required double totalPrice,
//   //   required UserEntity userEntity,
//   // }) async {
//   //   emit(OrderAdding());

//   //   final order = OrderEntity(
//   //     orderID: await ordersRepo.generateOrderId(),
//   //     uId: userEntity.uId,
//   //     userName: userEntity.name,
//   //     userEmail: userEntity.email,
//   //     //  userImage: userEntity.userImage,
//   //     cartEntity: cartEntity,
//   //     orderProducts: orderProducts,
//   //     totalPrice: totalPrice,
//   //     orderDate: Timestamp.now(),
//   //   );

//   //   final result = await ordersRepo.addOrder(order: order);

//   //   result.fold(
//   //     (failure) => emit(OrderAddingError(failure.message)),
//   //     (_) => emit(OrderAddedSuccess()),
//   //   );
//   // }
//   Future<void> addOrder({
//     required CartEntity cartEntity,
//     required List<OrderProductEntity> orderProducts,
//     required double totalPrice,
//     required UserEntity userEntity,
//   }) async {
//     emit(OrderAdding());

//     final order = OrderEntity(
//       orderID: await ordersRepo.generateOrderId(),
//       uId: userEntity.uId,
//       userName: userEntity.name,
//       userEmail: userEntity.email,
//       cartEntity: cartEntity,
//       orderProducts: orderProducts,
//       totalPrice: totalPrice,
//       orderDate: Timestamp.now(),
//     );

//     final result = await ordersRepo.addOrder(order: order);

//     result.fold((failure) => emit(OrderAddingError(failure.message)), (
//       _,
//     ) async {
//       emit(OrderAddedSuccess());

//       // ✅ بعد النجاح رجع كل الطلبات المحدثة
//       final ordersResult = await ordersRepo.addOrder(order: order);
//       ordersResult.fold(
//         (failure) => emit(OrdersError(failure.message)),
//         (_) => emit(OrderAddedSuccess()),
//       );
//     });
//   }

//   @override
//   Future<void> close() {
//     _streamSubscription?.cancel();
//     return super.close();
//   }
// }

// class OrdersCubit extends Cubit<OrdersState> {
//   final OrdersRepo ordersRepo;

//   OrdersCubit(this.ordersRepo) : super(OrdersInitial());

//   StreamSubscription? _streamSubscription;
//   static List<OrderModel> _orders = [];

//   List<OrderModel> get getOrders => List.unmodifiable(_orders);

//   void fetchUserOrders() {
//     emit(OrdersLoading());

//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) {
//       emit(OrdersError('المستخدم غير مسجل الدخول'));
//       return;
//     }

//     _streamSubscription = ordersRepo.fetchOrders(userId).listen((result) {
//       result.fold(
//         (failure) {
//           emit(OrdersError(failure.message));
//         },
//         (ordersList) {
//           _orders = _orders; // ✅ خزّن البيانات
//           emit(UserOrdersLoaded(_orders));
//         },
//       );
//     });
//   }

//   void clearOrders() {
//     _orders = [];
//     emit(OrdersInitial());
//   }

//   void fetchAllOrders() {
//     emit(OrdersLoading());

//     _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
//       result.fold(
//         (failure) {
//           emit(OrdersError(failure.message));
//         },
//         (ordersList) {
//           _orders = ordersList; // ✅ خزّن البيانات
//           emit(AllOrderSuccess(_orders));
//         },
//       );
//     });
//   }

//   Future<void> addOrder({
//     required CartEntity cartEntity,
//     required List<OrderProductEntity> orderProducts,
//     required double totalPrice,
//     required UserEntity userEntity,
//   }) async {
//     emit(OrderAdding());

//     final order = OrderEntity(
//       orderID: await ordersRepo.generateOrderId(),
//       uId: userEntity.uId,
//       userName: userEntity.name,
//       userEmail: userEntity.email,
//       cartEntity: cartEntity,
//       orderProducts: orderProducts,
//       totalPrice: totalPrice,
//       orderDate: Timestamp.now(),
//     );

//     final result = await ordersRepo.addOrder(order: order);

//     result.fold((failure) => emit(OrderAddingError(failure.message)), (_) {
//       emit(OrderAddedSuccess());
//       // ✅ بعد الإضافة رجّع الطلبات المحدثة
//       fetchUserOrders();
//     });
//   }

//   @override
//   Future<void> close() {
//     _streamSubscription?.cancel();
//     return super.close();
//   }
// }

// class OrdersCubit extends Cubit<OrdersState> {
//   final OrdersRepo ordersRepo;

//   OrdersCubit(this.ordersRepo) : super(OrdersInitial());

//   StreamSubscription? _streamSubscription;
//   static List<OrderModel> _orders = [];

//   List<OrderModel> get getOrders => List.unmodifiable(_orders);

//   void fetchUserOrders() {
//     emit(OrdersLoading());

//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) {
//       emit(OrdersError('المستخدم غير مسجل الدخول'));
//       return;
//     }

//     _streamSubscription = ordersRepo.fetchOrders(userId).listen((result) {
//       result.fold((failure) => emit(OrdersError(failure.message)), (
//         ordersList,
//       ) {
//         _orders = orders; // ✅ خزّن البيانات الجديدة
//         emit(UserOrdersLoaded(_orders));
//       });
//     });
//   }

//   void clearOrders() {
//     _orders = [];
//     emit(OrdersInitial());
//   }

//   void fetchAllOrders() {
//     emit(OrdersLoading());

//     _streamSubscription = ordersRepo.fetchAllOrders().listen((result) {
//       result.fold((failure) => emit(OrdersError(failure.message)), (
//         ordersList,
//       ) {
//         _orders = ordersList;
//         emit(AllOrderSuccess(_orders));
//       });
//     });
//   }

//   Future<void> addOrder({
//     required CartEntity cartEntity,
//     required List<OrderProductEntity> orderProducts,
//     required double totalPrice,
//     required UserEntity userEntity,
//   }) async {
//     emit(OrderAdding());

//     final order = OrderEntity(
//       orderID: await ordersRepo.generateOrderId(),
//       uId: userEntity.uId,
//       userName: userEntity.name,
//       userEmail: userEntity.email,
//       cartEntity: cartEntity,
//       orderProducts: orderProducts,
//       totalPrice: totalPrice,
//       orderDate: Timestamp.now(),
//     );

//     final result = await ordersRepo.addOrder(order: order);

//     result.fold((failure) => emit(OrderAddingError(failure.message)), (_) {
//       emit(OrderAddedSuccess());
//       fetchUserOrders(); // ✅ رجّع أحدث البيانات
//     });
//   }

//   @override
//   Future<void> close() {
//     _streamSubscription?.cancel();
//     return super.close();
//   }
// }

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  StreamSubscription? _streamSubscription;
  static List<OrderModel> _orders = [];
  List<OrderModel> get getOrders {
    return _orders;
  }

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
  void clearOrders() {
    _orders = [];
    emit(OrdersInitial());
  }

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
      // userImage: userEntity.userImage,
      cartEntity: cartEntity, // ✅ أضف هذا
      orderProducts: orderProducts,
      totalPrice: totalPrice,
      orderDate: Timestamp.now(),
    );

    // final order = OrderEntity(
    //   orderID: await ordersRepo.generateOrderId(),
    //   uId: userEntity.uId,
    //   userName: userEntity.name,
    //   userEmail: userEntity.email,
    //   // userImage: userEntity.userImage,
    //   //  cartEntity: cartEntity,
    //   orderProducts: orderProducts,
    //   totalPrice: totalPrice,

    //   orderDate: Timestamp.now(),
    // );

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
