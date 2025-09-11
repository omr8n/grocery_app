import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/models/wishlist_model.dart';
import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class WishlistRepo {
  Future<Either<Failure, void>> updateUserWishlist({
    required UserModel userModel,
    required List<WishlistModel> wishlistItems,
  });
}
