// import 'package:dartz/dartz.dart';

// import '../../../../core/errors/failures.dart';
// import '../../../../core/services/data_service.dart';

// import '../../../features/inner_screens/auth/data/models/user_model.dart';
// import '../../models/cart_item_model.dart';
// // import '../../models/cart_model.dart';
// import '../../utils/backend_endpoint.dart';
// import 'cart_repo.dart';

// class CartRepoImpl implements CartRepo {
//   final DatabaseService databaseService;

//   CartRepoImpl(this.databaseService);

//   @override
//   Future<Either<Failure, void>> updateUserCart({
//     required UserModel userModle,
//     required List<CartItemModel> cartItems,
//   }) async {
//     try {
//       await databaseService.updateData(
//         path: BackendEndpoint.updateUserData,
//         documentId: userModle.uId,
//         data: {'userCart': cartItems.map((item) => item.toJson()).toList()},
//       );
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/data_service.dart';
import '../../../features/inner_screens/auth/data/models/user_model.dart';
import '../../models/cart_item_model.dart';
import '../../utils/backend_endpoint.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final DatabaseService databaseService;

  CartRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, Unit>> updateUserCart({
    required UserModel userModel,
    required List<CartItemModel> cartItems,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendEndpoint.updateUserData,
        documentId: userModel.uId,
        data: {'userCart': cartItems.map((item) => item.toJson()).toList()},
      );
      return const Right(unit); // بدل null
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
