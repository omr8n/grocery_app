// import 'package:dartz/dartz.dart';
// import '../../../../core/errors/failures.dart';
// // import '../../../features/auth/data/models/user_model.dart';
// import '../../../features/inner_screens/auth/data/models/user_model.dart';
// import '../../models/cart_item_model.dart';
// // import '../../models/cart_model.dart';

// abstract class CartRepo {
//   Future<Either<Failure, void>> updateUserCart({
//     required UserModel userModel,
//     required List<CartItemModel> cartItems,
//   });
// }
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../features/inner_screens/auth/data/models/user_model.dart';
import '../../models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<Failure, Unit>> updateUserCart({
    required UserModel userModel,
    required List<CartItemModel> cartItems,
  });
}
