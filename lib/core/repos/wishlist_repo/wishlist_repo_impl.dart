import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/models/wishlist_model.dart';
import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/data_service.dart';
import '../../../../core/utils/backend_endpoint.dart';

import 'wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  final DatabaseService databaseService;

  WishlistRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> updateUserWishlist({
    required UserModel userModel,
    required List<WishlistModel> wishlistItems,
  }) async {
    try {
      // تحويل قائمة WishlistModel إلى JSON
      // final wishlistJsonList =
      //     wishlistItems.map((item) => item.toJson()).toList();

      await databaseService.updateData(
        path: BackendEndpoint.updateUserData,
        documentId: userModel.uId,
        data: {'userWish': wishlistItems.map((item) => item.toJson()).toList()},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
