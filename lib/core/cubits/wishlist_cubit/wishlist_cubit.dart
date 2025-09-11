// // // // // // // import 'dart:developer';
// // // // // // // import 'package:e_commerce_shop_smart/features/auth/data/models/user_model.dart';
// // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // // import 'package:uuid/uuid.dart';
// // // // // // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';
// // // // // // // import '../../models/wishlist_model.dart';

// // // // // // // part 'wishlist_state.dart';

// // // // // // // class WishlistCubit extends Cubit<WishlistState> {
// // // // // // //   final WishlistRepo wishlistRepo;

// // // // // // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // // // // // //   final List<WishlistModel> _wishlistItems = [];

// // // // // // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // // // // // //   bool isProductInWishlist(String productId) {
// // // // // // //     return _wishlistItems.any((item) => item.productId == productId);
// // // // // // //   }

// // // // // // //   void addProduct(String productId) {
// // // // // // //     if (isProductInWishlist(productId)) return;

// // // // // // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // // // // // //     _wishlistItems.add(newItem);
// // // // // // //     emit(
// // // // // // //       WishlistUpdated(
// // // // // // //         List.unmodifiable(_wishlistItems),
// // // // // // //         "Product added to wishlist",
// // // // // // //       ),
// // // // // // //     );
// // // // // // //     _syncWishlistWithFirestore();
// // // // // // //   }

// // // // // // //   void removeProduct(String productId) {
// // // // // // //     final removedItems =
// // // // // // //         _wishlistItems.where((item) => item.productId == productId).toList();
// // // // // // //     if (removedItems.isEmpty) return;

// // // // // // //     _wishlistItems.removeWhere((item) => item.productId == productId);
// // // // // // //     emit(
// // // // // // //       WishlistUpdated(
// // // // // // //         List.unmodifiable(_wishlistItems),
// // // // // // //         "Product removed from wishlist",
// // // // // // //       ),
// // // // // // //     );
// // // // // // //     _syncWishlistWithFirestore();
// // // // // // //   }

// // // // // // //   void clearWishlist() {
// // // // // // //     _wishlistItems.clear();
// // // // // // //     emit(
// // // // // // //       WishlistUpdated(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// // // // // // //     );
// // // // // // //     _syncWishlistWithFirestore();
// // // // // // //   }

// // // // // // //   void addOrRemoveFromWishlist(String productId) {
// // // // // // //     if (isProductInWishlist(productId)) {
// // // // // // //       removeProduct(productId);
// // // // // // //     } else {
// // // // // // //       addProduct(productId);
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> _syncWishlistWithFirestore() async {
// // // // // // //     final user = FirebaseAuth.instance.currentUser;
// // // // // // //     if (user == null) return;

// // // // // // //     final userModel = UserModel.fromFirebaseUser(user);
// // // // // // //     final result = await wishlistRepo.updateUserWishlist(
// // // // // // //       userModel: userModel,
// // // // // // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // // // // // //     );

// // // // // // //     result.fold(
// // // // // // //       (failure) => log("Error syncing wishlist: ${failure.message}"),
// // // // // // //       (_) => log("Wishlist synced with Firestore"),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'dart:developer';
// // // // // // // import 'package:e_commerce_shop_smart/features/auth/data/models/user_model.dart';
// // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // // // // // import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';
// // // // // // import 'package:uuid/uuid.dart';
// // // // // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';
// // // // // // // import '../../../Features/auth/presentation/views/signin_view.dart';
// // // // // // import '../../models/wishlist_model.dart';

// // // // // // import '../../services/firebase_auth_service.dart'; // تأكد من المسار الصحيح

// // // // // // part 'wishlist_state.dart';

// // // // // // class WishlistCubit extends Cubit<WishlistState> {
// // // // // //   final WishlistRepo wishlistRepo;

// // // // // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // // // // //   final List<WishlistModel> _wishlistItems = [];

// // // // // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // // // // //   bool isProductInWishlist(String productId) {
// // // // // //     return _wishlistItems.any((item) => item.productId == productId);
// // // // // //   }

// // // // // //   void addProduct(String productId) {
// // // // // //     if (isProductInWishlist(productId)) return;

// // // // // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // // // // //     _wishlistItems.add(newItem);
// // // // // //     emit(
// // // // // //       WishlistUpdated(
// // // // // //         List.unmodifiable(_wishlistItems),
// // // // // //         "Product added to wishlist",
// // // // // //       ),
// // // // // //     );
// // // // // //     _syncWishlistWithFirestore();
// // // // // //   }

// // // // // //   void removeProduct(String productId) {
// // // // // //     final removedItems = _wishlistItems
// // // // // //         .where((item) => item.productId == productId)
// // // // // //         .toList();
// // // // // //     if (removedItems.isEmpty) return;

// // // // // //     _wishlistItems.removeWhere((item) => item.productId == productId);
// // // // // //     emit(
// // // // // //       WishlistUpdated(
// // // // // //         List.unmodifiable(_wishlistItems),
// // // // // //         "Product removed from wishlist",
// // // // // //       ),
// // // // // //     );
// // // // // //     _syncWishlistWithFirestore();
// // // // // //   }

// // // // // //   void clearWishlist() {
// // // // // //     _wishlistItems.clear();
// // // // // //     emit(
// // // // // //       WishlistUpdated(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// // // // // //     );
// // // // // //     _syncWishlistWithFirestore();
// // // // // //   }

// // // // // //   void addOrRemoveFromWishlist(String productId, BuildContext context) {
// // // // // //     if (!FirebaseAuthService.isLoggedIn()) {
// // // // // //       _showLoginDialog(context);
// // // // // //       return;
// // // // // //     }

// // // // // //     if (isProductInWishlist(productId)) {
// // // // // //       removeProduct(productId);
// // // // // //     } else {
// // // // // //       addProduct(productId);
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> _syncWishlistWithFirestore() async {
// // // // // //     final user = FirebaseAuth.instance.currentUser;
// // // // // //     if (user == null) return;

// // // // // //     final userModel = UserModel.fromFirebaseUser(user);
// // // // // //     final result = await wishlistRepo.updateUserWishlist(
// // // // // //       userModel: userModel,
// // // // // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // // // // //     );

// // // // // //     result.fold(
// // // // // //       (failure) => log("Error syncing wishlist: ${failure.message}"),
// // // // // //       (_) => log("Wishlist synced with Firestore"),
// // // // // //     );
// // // // // //   }

// // // // // //   void _showLoginDialog(BuildContext context) {
// // // // // //     showDialog(
// // // // // //       context: context,
// // // // // //       builder: (_) => AlertDialog(
// // // // // //         title: const Text("تنبيه"),
// // // // // //         content: const Text(
// // // // // //           "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
// // // // // //         ),
// // // // // //         actions: [
// // // // // //           TextButton(
// // // // // //             onPressed: () {
// // // // // //               Navigator.pop(context);
// // // // // //             },
// // // // // //             child: const Text("إلغاء"),
// // // // // //           ),
// // // // // //           TextButton(
// // // // // //             onPressed: () {
// // // // // //               Navigator.pop(context);
// // // // // //               Navigator.pushNamed(context, SigninView.routeName);
// // // // // //               // Navigator.pushNamed(
// // // // // //               //   context,
// // // // // //               //   '/LoginView',
// // // // // //               // );
// // // // // //               //// عدل المسار حسب شاشة تسجيل الدخول لديك
// // // // // //             },
// // // // // //             child: const Text("تسجيل الدخول"),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:developer';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // // // // import 'package:uuid/uuid.dart';
// // // // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';
// // // // // import '../../models/wishlist_model.dart';
// // // // // import '../../services/firebase_auth_service.dart'; // تأكد من المسار الصحيح
// // // // // import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';

// // // // // part 'wishlist_state.dart';

// // // // // class WishlistCubit extends Cubit<WishlistState> {
// // // // //   final WishlistRepo wishlistRepo;

// // // // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // // // //   final List<WishlistModel> _wishlistItems = [];

// // // // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // // // //   /// تحقق إذا المنتج موجود بالمفضلة
// // // // //   bool isProductInWishlist(String productId) {
// // // // //     return _wishlistItems.any((item) => item.productId == productId);
// // // // //   }

// // // // //   /// إضافة منتج
// // // // //   void addProduct(String productId) {
// // // // //     if (isProductInWishlist(productId)) return;

// // // // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // // // //     _wishlistItems.add(newItem);

// // // // //     emit(
// // // // //       WishlistSuccess(
// // // // //         List.unmodifiable(_wishlistItems),
// // // // //         "Product added to wishlist",
// // // // //       ),
// // // // //     );

// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   /// إزالة منتج
// // // // //   void removeProduct(String productId) {
// // // // //     if (!isProductInWishlist(productId)) return;

// // // // //     _wishlistItems.removeWhere((item) => item.productId == productId);

// // // // //     emit(
// // // // //       WishlistSuccess(
// // // // //         List.unmodifiable(_wishlistItems),
// // // // //         "Product removed from wishlist",
// // // // //       ),
// // // // //     );

// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   /// مسح كل المفضلة
// // // // //   void clearWishlist() {
// // // // //     _wishlistItems.clear();

// // // // //     emit(
// // // // //       WishlistSuccess(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// // // // //     );

// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   /// إضافة أو إزالة المنتج مع التحقق من تسجيل الدخول
// // // // //   void addOrRemoveFromWishlist(String productId, BuildContext context) {
// // // // //     if (!FirebaseAuthService.isLoggedIn()) {
// // // // //       _showLoginDialog(context);
// // // // //       return;
// // // // //     }

// // // // //     if (isProductInWishlist(productId)) {
// // // // //       removeProduct(productId);
// // // // //     } else {
// // // // //       addProduct(productId);
// // // // //     }
// // // // //   }

// // // // //   /// مزامنة مع Firestore
// // // // //   Future<void> _syncWishlistWithFirestore() async {
// // // // //     final user = FirebaseAuth.instance.currentUser;
// // // // //     if (user == null) return;

// // // // //     final result = await wishlistRepo.updateUserWishlist(
// // // // //       userModel: UserModel.fromFirebaseUser(user),
// // // // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // // // //     );

// // // // //     result.fold(
// // // // //       (failure) => log("Error syncing wishlist: ${failure.message}"),
// // // // //       (_) => log("Wishlist synced with Firestore"),
// // // // //     );
// // // // //   }

// // // // //   /// عرض تنبيه تسجيل الدخول
// // // // //   void _showLoginDialog(BuildContext context) {
// // // // //     showDialog(
// // // // //       context: context,
// // // // //       builder: (_) => AlertDialog(
// // // // //         title: const Text("تنبيه"),
// // // // //         content: const Text(
// // // // //           "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
// // // // //         ),
// // // // //         actions: [
// // // // //           TextButton(
// // // // //             onPressed: () => Navigator.pop(context),
// // // // //             child: const Text("إلغاء"),
// // // // //           ),
// // // // //           TextButton(
// // // // //             onPressed: () {
// // // // //               Navigator.pop(context);
// // // // //               Navigator.pushNamed(context, SigninView.routeName);
// // // // //             },
// // // // //             child: const Text("تسجيل الدخول"),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // // import 'dart:developer';
// // // // // import 'package:e_commerce_shop_smart/features/auth/data/models/user_model.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import 'package:uuid/uuid.dart';
// // // // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';
// // // // // import '../../models/wishlist_model.dart';

// // // // // part 'wishlist_state.dart';

// // // // // class WishlistCubit extends Cubit<WishlistState> {
// // // // //   final WishlistRepo wishlistRepo;

// // // // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // // // //   final List<WishlistModel> _wishlistItems = [];

// // // // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // // // //   bool isProductInWishlist(String productId) {
// // // // //     return _wishlistItems.any((item) => item.productId == productId);
// // // // //   }

// // // // //   void addProduct(String productId) {
// // // // //     if (isProductInWishlist(productId)) return;

// // // // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // // // //     _wishlistItems.add(newItem);
// // // // //     emit(
// // // // //       WishlistUpdated(
// // // // //         List.unmodifiable(_wishlistItems),
// // // // //         "Product added to wishlist",
// // // // //       ),
// // // // //     );
// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   void removeProduct(String productId) {
// // // // //     final removedItems =
// // // // //         _wishlistItems.where((item) => item.productId == productId).toList();
// // // // //     if (removedItems.isEmpty) return;

// // // // //     _wishlistItems.removeWhere((item) => item.productId == productId);
// // // // //     emit(
// // // // //       WishlistUpdated(
// // // // //         List.unmodifiable(_wishlistItems),
// // // // //         "Product removed from wishlist",
// // // // //       ),
// // // // //     );
// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   void clearWishlist() {
// // // // //     _wishlistItems.clear();
// // // // //     emit(
// // // // //       WishlistUpdated(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// // // // //     );
// // // // //     _syncWishlistWithFirestore();
// // // // //   }

// // // // //   void addOrRemoveFromWishlist(String productId) {
// // // // //     if (isProductInWishlist(productId)) {
// // // // //       removeProduct(productId);
// // // // //     } else {
// // // // //       addProduct(productId);
// // // // //     }
// // // // //   }

// // // // //   Future<void> _syncWishlistWithFirestore() async {
// // // // //     final user = FirebaseAuth.instance.currentUser;
// // // // //     if (user == null) return;

// // // // //     final userModel = UserModel.fromFirebaseUser(user);
// // // // //     final result = await wishlistRepo.updateUserWishlist(
// // // // //       userModel: userModel,
// // // // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // // // //     );

// // // // //     result.fold(
// // // // //       (failure) => log("Error syncing wishlist: ${failure.message}"),
// // // // //       (_) => log("Wishlist synced with Firestore"),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'dart:developer';
// // // // // import 'package:e_commerce_shop_smart/features/auth/data/models/user_model.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import 'package:grocery_app/core/models/wishlist_model.dart';
// // // // import 'package:grocery_app/core/services/firebase_auth_service.dart';
// // // // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // // // import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';
// // // // import 'package:uuid/uuid.dart';
// // // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';
// // // // // import '../../../Features/auth/presentation/views/signin_view.dart';
// // // // // import '../../models/wishlist_model.dart';

// // // // // import '../../services/firebase_auth_service.dart'; // تأكد من المسار الصحيح

// // // // part 'wishlist_state.dart';

// // // // class WishlistCubit extends Cubit<WishlistState> {
// // // //   final WishlistRepo wishlistRepo;

// // // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // // //   final List<WishlistModel> _wishlistItems = [];

// // // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // // //   bool isProductInWishlist(String productId) {
// // // //     return _wishlistItems.any((item) => item.productId == productId);
// // // //   }

// // // //   void addProduct(String productId) {
// // // //     if (isProductInWishlist(productId)) return;

// // // //     emit(WishlistLoading());

// // // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // // //     _wishlistItems.add(newItem);

// // // //     emit(
// // // //       WishlistSuccess(
// // // //         wishlistItems: List.unmodifiable(_wishlistItems),
// // // //         message: "Product added to wishlist",
// // // //       ),
// // // //     );

// // // //     _syncWishlistWithFirestore();
// // // //   }

// // // //   void removeProduct(String productId) {
// // // //     if (!isProductInWishlist(productId)) return;

// // // //     emit(WishlistLoading());

// // // //     _wishlistItems.removeWhere((item) => item.productId == productId);

// // // //     emit(
// // // //       WishlistSuccess(
// // // //         wishlistItems: List.unmodifiable(_wishlistItems),
// // // //         message: "Product removed from wishlist",
// // // //       ),
// // // //     );

// // // //     _syncWishlistWithFirestore();
// // // //   }

// // // //   void clearWishlist() {
// // // //     emit(WishlistLoading());

// // // //     _wishlistItems.clear();

// // // //     emit(
// // // //       WishlistSuccess(
// // // //         wishlistItems: List.unmodifiable(_wishlistItems),
// // // //         message: "Wishlist cleared",
// // // //       ),
// // // //     );

// // // //     _syncWishlistWithFirestore();
// // // //   }

// // // //   void addOrRemoveFromWishlist(String productId, BuildContext context) {
// // // //     if (!FirebaseAuthService.isLoggedIn()) {
// // // //       _showLoginDialog(context);
// // // //       return;
// // // //     }

// // // //     if (isProductInWishlist(productId)) {
// // // //       removeProduct(productId);
// // // //     } else {
// // // //       addProduct(productId);
// // // //     }
// // // //   }

// // // //   Future<void> _syncWishlistWithFirestore() async {
// // // //     final user = FirebaseAuth.instance.currentUser;
// // // //     if (user == null) return;

// // // //     final result = await wishlistRepo.updateUserWishlist(
// // // //       userModel: UserModel.fromFirebaseUser(user),
// // // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // // //     );

// // // //     result.fold(
// // // //       (failure) =>
// // // //           emit(WishlistFailure("Error syncing wishlist: ${failure.message}")),
// // // //       (_) => debugPrint("Wishlist synced with Firestore"),
// // // //     );
// // // //   }

// // // //   void _showLoginDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (_) => AlertDialog(
// // // //         title: const Text("تنبيه"),
// // // //         content: const Text(
// // // //           "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
// // // //         ),
// // // //         actions: [
// // // //           TextButton(
// // // //             onPressed: () => Navigator.pop(context),
// // // //             child: const Text("إلغاء"),
// // // //           ),
// // // //           TextButton(
// // // //             onPressed: () {
// // // //               Navigator.pop(context);
// // // //               Navigator.pushNamed(context, SigninView.routeName);
// // // //             },
// // // //             child: const Text("تسجيل الدخول"),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'dart:developer';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:grocery_app/core/models/wishlist_model.dart';
// // // import 'package:grocery_app/core/services/firebase_auth_service.dart';
// // // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // // import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';
// // // import 'package:uuid/uuid.dart';
// // // import '../../../../../core/repos/wishlist_repo/wishlist_repo.dart';

// // // part 'wishlist_state.dart';

// // // class WishlistCubit extends Cubit<WishlistState> {
// // //   final WishlistRepo wishlistRepo;

// // //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// // //   final List<WishlistModel> _wishlistItems = [];

// // //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// // //   bool isProductInWishlist(String productId) {
// // //     return _wishlistItems.any((item) => item.productId == productId);
// // //   }

// // //   void addProduct(String productId) {
// // //     if (isProductInWishlist(productId)) return;
// // //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// // //     _wishlistItems.add(newItem);
// // //     emit(
// // //       WishlistSuccess(List.unmodifiable(_wishlistItems), "Added to wishlist"),
// // //     );
// // //     _syncWishlistWithFirestore();
// // //   }

// // //   void removeProduct(String productId) {
// // //     if (!isProductInWishlist(productId)) return;
// // //     _wishlistItems.removeWhere((item) => item.productId == productId);
// // //     emit(
// // //       WishlistSuccess(
// // //         List.unmodifiable(_wishlistItems),
// // //         "Removed from wishlist",
// // //       ),
// // //     );
// // //     _syncWishlistWithFirestore();
// // //   }

// // //   void clearWishlist() {
// // //     _wishlistItems.clear();
// // //     emit(
// // //       WishlistSuccess(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// // //     );
// // //     _syncWishlistWithFirestore();
// // //   }

// // //   void addOrRemoveFromWishlist(String productId, BuildContext context) {
// // //     if (!FirebaseAuthService.isLoggedIn()) {
// // //       _showLoginDialog(context);
// // //       return;
// // //     }
// // //     if (isProductInWishlist(productId)) {
// // //       removeProduct(productId);
// // //     } else {
// // //       addProduct(productId);
// // //     }
// // //   }

// // //   Future<void> _syncWishlistWithFirestore() async {
// // //     final user = FirebaseAuth.instance.currentUser;
// // //     if (user == null) return;
// // //     final result = await wishlistRepo.updateUserWishlist(
// // //       userModel: UserModel.fromFirebaseUser(user),
// // //       wishlistItems: List.unmodifiable(_wishlistItems),
// // //     );
// // //     result.fold(
// // //       (failure) => log("Error syncing wishlist: ${failure.message}"),
// // //       (_) => log("Wishlist synced with Firestore"),
// // //     );
// // //   }

// // //   void _showLoginDialog(BuildContext context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (_) => AlertDialog(
// // //         title: const Text("تنبيه"),
// // //         content: const Text(
// // //           "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
// // //         ),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: const Text("إلغاء"),
// // //           ),
// // //           TextButton(
// // //             onPressed: () {
// // //               Navigator.pop(context);
// // //               Navigator.pushNamed(context, SigninView.routeName);
// // //             },
// // //             child: const Text("تسجيل الدخول"),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:developer';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:grocery_app/core/models/wishlist_model.dart';
// // import 'package:grocery_app/core/repos/wishlist_repo/wishlist_repo.dart';
// // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';
// // import 'package:uuid/uuid.dart';

// // part 'wishlist_state.dart';

// // class WishlistCubit extends Cubit<WishlistState> {
// //   final WishlistRepo wishlistRepo;

// //   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

// //   final List<WishlistModel> _wishlistItems = [];

// //   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

// //   bool isProductInWishlist(String productId) {
// //     return _wishlistItems.any((item) => item.productId == productId);
// //   }

// //   void addProduct(String productId) {
// //     if (isProductInWishlist(productId)) return;

// //     final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// //     _wishlistItems.add(newItem);
// //     emit(
// //       WishlistSuccess(
// //         List.unmodifiable(_wishlistItems),
// //         "Product added to wishlist",
// //       ),
// //     );
// //     _syncWishlistWithFirestore();
// //   }

// //   // void addProduct(String productId) {
// //   //   if (isProductInWishlist(productId)) return;

// //   //   final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
// //   //   _wishlistItems.add(newItem);
// //   //   emit(
// //   //     WishlistSuccess(
// //   //       List.unmodifiable(_wishlistItems),
// //   //       "Product added to wishlist",
// //   //     ),
// //   //   );
// //   //   _syncWishlistWithFirestore();
// //   // }

// //   void removeProduct(String productId) {
// //     _wishlistItems.removeWhere((item) => item.productId == productId);
// //     emit(
// //       WishlistSuccess(
// //         List.unmodifiable(_wishlistItems),
// //         "Product removed from wishlist",
// //       ),
// //     );
// //     _syncWishlistWithFirestore();
// //   }

// //   void clearWishlist() {
// //     _wishlistItems.clear();
// //     emit(
// //       WishlistSuccess(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
// //     );
// //     _syncWishlistWithFirestore();
// //   }

// //   void addOrRemoveFromWishlist(String productId, BuildContext context) {
// //     if (FirebaseAuth.instance.currentUser == null) {
// //       _showLoginDialog(context);
// //       return;
// //     }

// //     if (isProductInWishlist(productId)) {
// //       removeProduct(productId);
// //     } else {
// //       addProduct(productId);
// //     }
// //   }

// //   // Future<void> _syncWishlistWithFirestore() async {
// //   //   final user = FirebaseAuth.instance.currentUser;
// //   //   if (user == null) return;

// //   //   final userModel = UserModel.fromFirebaseUser(user);
// //   //   final result = await wishlistRepo.updateUserWishlist(
// //   //     userModel: userModel,
// //   //     wishlistItems: List.unmodifiable(_wishlistItems),
// //   //   );

// //   //   result.fold(
// //   //     (failure) => log("Error syncing wishlist: ${failure.message}"),
// //   //     (_) => log("Wishlist synced with Firestore"),
// //   //   );
// //   // }
// //   Future<void> _syncWishlistWithFirestore() async {
// //     final user = FirebaseAuth.instance.currentUser;
// //     if (user == null) return;

// //     final userModel = UserModel.fromFirebaseUser(user);

// //     try {
// //       final result = await wishlistRepo.updateUserWishlist(
// //         userModel: userModel,
// //         wishlistItems: List.unmodifiable(_wishlistItems),
// //       );

// //       result.fold((failure) {
// //         emit(WishlistFailure(failure.message));
// //         log("Error syncing wishlist: ${failure.message}");
// //       }, (_) => log("Wishlist synced with Firestore"));
// //     } catch (e) {
// //       emit(WishlistFailure(e.toString()));
// //       log("Unexpected error syncing wishlist: $e");
// //     }
// //   }

// //   void _showLoginDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text("تنبيه"),
// //         content: const Text(
// //           "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text("إلغاء"),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               Navigator.pushNamed(context, SigninView.routeName);
// //             },
// //             child: const Text("تسجيل الدخول"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:developer';

// // import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/models/wishlist_model.dart';
// import 'package:grocery_app/core/repos/wishlist_repo/wishlist_repo.dart';
// import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// import 'package:uuid/uuid.dart';

// part 'wishlist_state.dart';

// class WishlistCubit extends Cubit<WishlistState> {
//   final WishlistRepo wishlistRepo;

//   WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

//   final List<WishlistModel> _wishlistItems = [];

//   List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

//   bool isProductInWishlist(String productId) {
//     return _wishlistItems.any((item) => item.productId == productId);
//   }

//   /// جلب المفضلة من Firestore
//   Future<void> fetchWishlist() async {
//     emit(WishlistLoading());

//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       emit(WishlistFailure('User not logged in'));
//       return;
//     }

//     try {
//       final userModel = UserModel.fromFirebaseUser(user);

//       // نفترض الـ repo يعيد المفضلة الحالية (تحتاج تضيف دالة جديدة لو ما موجودة)
//       // هنا مجرد مثال لتحديث `_wishlistItems` بعد جلب البيانات
//       // _wishlistItems = await wishlistRepo.getUserWishlist(userModel);

//       emit(WishlistSuccess(List.unmodifiable(_wishlistItems)));
//     } catch (e) {
//       emit(WishlistFailure(e.toString()));
//     }
//   }

//   /// إضافة منتج للمفضلة
//   void addProduct(WishlistModel item) {
//     if (isProductInWishlist(item.productId)) return;

//     _wishlistItems.add(item);
//     emit(WishlistSuccess(List.unmodifiable(_wishlistItems), "Product added"));
//     _syncWishlistWithFirestore();
//   }

//   /// إزالة منتج من المفضلة
//   void removeProduct(String productId) {
//     _wishlistItems.removeWhere((item) => item.productId == productId);
//     emit(WishlistSuccess(List.unmodifiable(_wishlistItems), "Product removed"));
//     _syncWishlistWithFirestore();
//   }

//   /// مسح كل المفضلة
//   void clearWishlist() {
//     _wishlistItems.clear();
//     emit(
//       WishlistSuccess(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
//     );
//     _syncWishlistWithFirestore();
//   }

//   /// إضافة أو إزالة المنتج حسب حالته
//   void addOrRemoveFromWishlist(String productId) {
//     final existingItem = _wishlistItems.firstWhere(
//       (item) => item.productId == productId,
//       orElse: () => WishlistModel(id: '', productId: ''),
//     );

//     if (existingItem.id.isNotEmpty) {
//       removeProduct(productId);
//     } else {
//       addProduct(WishlistModel(id: const Uuid().v4(), productId: productId));
//     }
//   }

//   /// مزامنة المفضلة مع Firestore
//   Future<void> _syncWishlistWithFirestore() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final userModel = UserModel.fromFirebaseUser(user);

//     try {
//       final result = await wishlistRepo.updateUserWishlist(
//         userModel: userModel,
//         wishlistItems: List.unmodifiable(_wishlistItems),
//       );

//       result.fold(
//         (failure) => emit(WishlistFailure(failure.message)),
//         (_) => log("Wishlist synced with Firestore"),
//       );
//     } catch (e) {
//       emit(WishlistFailure(e.toString()));
//     }
//   }
// }
import 'dart:developer';
// import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/features/inner_screens/auth/signin_view.dart';
import 'package:uuid/uuid.dart';
import 'package:grocery_app/core/models/wishlist_model.dart';
import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
import 'package:grocery_app/core/repos/wishlist_repo/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;

  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

  final List<WishlistModel> _wishlistItems = [];

  List<WishlistModel> get wishlistItems => List.unmodifiable(_wishlistItems);

  bool isProductInWishlist(String productId) {
    return _wishlistItems.any((item) => item.productId == productId);
  }

  void addProduct(String productId) {
    if (isProductInWishlist(productId)) return;

    final newItem = WishlistModel(id: const Uuid().v4(), productId: productId);
    _wishlistItems.add(newItem);
    emit(
      WishlistUpdated(
        List.unmodifiable(_wishlistItems),
        "Product added to wishlist",
      ),
    );
    _syncWishlistWithFirestore();
  }

  void removeProduct(String productId) {
    final removedItems = _wishlistItems
        .where((item) => item.productId == productId)
        .toList();
    if (removedItems.isEmpty) return;

    _wishlistItems.removeWhere((item) => item.productId == productId);
    emit(
      WishlistUpdated(
        List.unmodifiable(_wishlistItems),
        "Product removed from wishlist",
      ),
    );
    _syncWishlistWithFirestore();
  }

  /// 🧹 تصفير المفضلة (للاستخدام العادي مع مستخدم مسجل دخول)
  void clearWishlist() {
    _wishlistItems.clear();
    emit(
      WishlistUpdated(List.unmodifiable(_wishlistItems), "Wishlist cleared"),
    );
    _syncWishlistWithFirestore();
  }

  /// 🧹 تصفير محلي فقط (وقت الـ logout)
  void resetWishlist() {
    _wishlistItems.clear();
    emit(WishlistInitial());
  }

  void addOrRemoveFromWishlist(String productId, BuildContext context) {
    if (!FirebaseAuthService().isLoggedIn()) {
      _showLoginDialog(context);
      return;
    }

    if (isProductInWishlist(productId)) {
      removeProduct(productId);
    } else {
      addProduct(productId);
    }
  }

  Future<void> _syncWishlistWithFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userModel = UserModel.fromFirebaseUser(user);
    final result = await wishlistRepo.updateUserWishlist(
      userModel: userModel,
      wishlistItems: List.unmodifiable(_wishlistItems),
    );

    result.fold(
      (failure) => log("Error syncing wishlist: ${failure.message}"),
      (_) => log("Wishlist synced with Firestore"),
    );
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تنبيه"),
        content: const Text(
          "يجب عليك تسجيل الدخول لإضافة المنتجات إلى المفضلة.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SigninView.routeName);
            },
            child: const Text("تسجيل الدخول"),
          ),
        ],
      ),
    );
  }
}
