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
