// // import 'package:dartz/dartz.dart';
// // import '../../../../core/errors/failures.dart';
// // import '../../../features/auth/data/models/user_model.dart';
// // import '../../models/order_model.dart';

// // abstract class OrdersRepo {
// //   Future<Either<Failure, void>> placeOrder({
// //     required UserModel userModel,
// //     required OrderModel orderModel,
// //   });

// //   Future<Either<Failure, List<OrderModel>>> fetchUserOrders({
// //     required String userId,
// //   });
// // }

// import 'package:dartz/dartz.dart';
// import 'package:e_commerce_shop_smart/core/models/order_product_model.dart';
// import '../../entities/order_entity.dart';
// import '../../errors/failures.dart';
// import '../../models/order_model.dart';

// abstract class OrdersRepo {
//   Future<Either<Failure, void>> addOrder({required OrderEntity order});
//   Future<Either<Failure, List<OrderModel>>> fetchUserOrders(String userId);
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
// import '../../entities/order_entity.dart';
import '../../entites/order_entity.dart';
import '../../errors/failures.dart';
// import '../../utils/backend_endpoint.dart';

abstract class OrdersRepo {
  // String generateOrderId() {
  //   // فقط توليد doc id جديد من Firestore collection بدون إنشاء مستند فعلي
  //   return FirebaseFirestore.instance
  //       .collection(BackendEndpoint.addOrder)
  //       .doc()
  //       .id;
  // }
  Future<String> generateOrderId();
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders(String userId);
  Stream<Either<Failure, List<OrderEntity>>> fetchAllOrders();
}
