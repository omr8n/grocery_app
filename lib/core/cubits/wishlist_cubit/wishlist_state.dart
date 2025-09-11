// // // part of 'wishlist_cubit.dart';

// // // /// الحالة الأساسية
// // // sealed class WishlistState {}

// // // /// الحالة الابتدائية
// // // final class WishlistInitial extends WishlistState {}

// // // /// حالة التحميل
// // // final class WishlistLoading extends WishlistState {}

// // // /// حالة النجاح مع عناصر المفضلة
// // // final class WishlistSuccess extends WishlistState {
// // //   final List<WishlistModel> wishlistItems;
// // //   final String message;

// // //   WishlistSuccess({required this.wishlistItems, required this.message});
// // // }

// // // /// حالة الفشل
// // // final class WishlistFailure extends WishlistState {
// // //   final String message;

// // //   WishlistFailure(this.message);
// // // }
// // part of 'wishlist_cubit.dart';

// // sealed class WishlistState {}

// // final class WishlistInitial extends WishlistState {}

// // final class WishlistLoading extends WishlistState {}

// // final class WishlistSuccess extends WishlistState {
// //   final List<WishlistModel> wishlistItems;
// //   final String message;

// //   WishlistSuccess(this.wishlistItems, this.message);
// // }

// // final class WishlistFailure extends WishlistState {
// //   final String message;
// //   WishlistFailure(this.message);
// // }
// part of 'wishlist_cubit.dart';

// abstract class WishlistState {}

// class WishlistInitial extends WishlistState {}

// class WishlistLoading extends WishlistState {}

// class WishlistSuccess extends WishlistState {
//   final List<WishlistModel> wishlistItems;
//   final String message;

//   WishlistSuccess(this.wishlistItems, [this.message = '']);
// }

// class WishlistFailure extends WishlistState {
//   final String message;

//   WishlistFailure(this.message);
// }
part of 'wishlist_cubit.dart';

sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistUpdated extends WishlistState {
  final List<WishlistModel> wishlistItems;
  final String message;

  WishlistUpdated(this.wishlistItems, this.message);
}
