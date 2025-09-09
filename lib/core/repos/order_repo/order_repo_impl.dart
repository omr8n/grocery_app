import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

// import '../../entities/order_entity.dart';
import '../../entites/order_entity.dart';
import '../../errors/failures.dart';
import '../../models/order_model.dart';
import '../../services/data_service.dart';
import '../../utils/backend_endpoint.dart';
import 'order_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImpl(this._databaseService);

  /// توليد معرف فريد جديد للطلب
  // String generateOrderId() {
  //
  // }
  @override
  Future<String> generateOrderId() async {
    return FirebaseFirestore.instance
        .collection(BackendEndpoint.addOrder)
        .doc()
        .id;
  }

  /// يضيف طلب جديد في قاعدة البيانات
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      final orderModel = OrderModel.fromEntity(order);

      await _databaseService.addData(
        path: BackendEndpoint.addOrder,
        documentId: orderModel.orderID,
        data: orderModel.toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add order: $e'));
    }
  }

  /// يستمع لتدفق طلبات مستخدم معين عبر معرفه (uId)
  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders(String userId) async* {
    try {
      await for (final data in _databaseService.streamData(
        path: BackendEndpoint.getOrders,
        whereField: 'uId',
        isEqualTo: userId,
      )) {
        final orders = data
            .map<OrderEntity>((json) => OrderModel.fromJson(json).toEntity())
            .toList();

        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('Failed to fetch orders: $e'));
    }
  }

  // /// جلب كل الطلبات (مثلاً للمدير)
  // Stream<Either<Failure, List<OrderEntity>>> fetchAllOrders() async* {
  //   try {
  //     await for (final data in _databaseService.streamData(
  //       path: BackendEndpoint.getOrders,
  //     )) {
  //       final orders =
  //           data
  //               .map<OrderEntity>(
  //                 (json) => OrderModel.fromJson(json).toEntity(),
  //               )
  //               .toList();

  //       yield Right(orders);
  //     }
  //   } catch (e) {
  //     yield Left(ServerFailure('Failed to fetch all orders: $e'));
  //   }
  // }
  // @override
  // Stream<Either<Failure, List<OrderEntity>>> fetchAllOrders() async* {
  //   try {
  //     await for (final data in _databaseService.streamData(
  //       path: BackendEndpoint.getOrders,
  //     )) {
  //       if (data is List) {
  //         final orders =
  //             data
  //                 .map<OrderEntity?>((e) {
  //                   try {
  //                     return OrderModel.fromJson(e).toEntity();
  //                   } catch (_) {
  //                     return null;
  //                   }
  //                 })
  //                 .whereType<OrderEntity>()
  //                 .toList();

  //         yield Right(orders);
  //       } else {
  //         yield Left(ServerFailure('البيانات المستلمة غير صالحة'));
  //       }
  //     }
  //   } catch (e, stack) {
  //     yield Left(ServerFailure('فشل في جلب الطلبات: ${e.toString()}'));
  //   }
  // }
  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchAllOrders() async* {
    try {
      await for (final rawData in _databaseService.streamData(
        path: BackendEndpoint.getOrders,
      )) {
        if (rawData is List) {
          final orders = rawData
              .map<OrderEntity?>((e) {
                try {
                  return OrderModel.fromJson(e).toEntity();
                } catch (_) {
                  return null;
                }
              })
              .whereType<OrderEntity>()
              .toList();

          yield Right(orders);
        } else {
          yield Left(ServerFailure('البيانات المستلمة غير صالحة'));
        }
      }
    } catch (e, stack) {
      yield Left(ServerFailure('فشل في جلب الطلبات: ${e.toString()}'));
    }
  }

  // Stream<Either<Failure, List<OrderEntity>>> fetchAllOrders() async* {
  //   try {
  //     await for (var data in _databaseService.streamData(
  //       path: BackendEndpoint.getOrders,
  //     )) {
  //       List<OrderEntity> orders =
  //           (data as List<dynamic>)
  //               .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
  //               .toList();
  //       yield Right(orders);
  //     }
  //   } catch (e) {
  //     yield Left(ServerFailure('Failed to fetch orders'));
  //   }
  // }
}
