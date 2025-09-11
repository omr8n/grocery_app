// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:uuid/uuid.dart';

// // import 'package:grocery_app/core/entites/product_entity.dart';
// // import 'package:grocery_app/core/models/cart_item_model.dart';
// // import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
// // import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';

// // part 'cart_state.dart';

// // class CartCubit extends Cubit<CartState> {
// //   final CartRepo cartRepo;

// //   CartCubit(this.cartRepo) : super(CartInitial());

// //   CartEntity _cartEntity = const CartEntity([]);

// //   List<CartItemEntity> get cartItems => _cartEntity.cartItems;

// //   double get totalPrice => _cartEntity.calculateTotalPrice();

// //   void addProductWithAuthCheck(ProductEntity productEntity) {
// //     if (!FirebaseAuth.instance.currentUserIsLoggedIn()) {
// //       emit(CartAuthRequired());
// //       return;
// //     }
// //     addProduct(productEntity);
// //   }

// //   Future<void> addProduct(ProductEntity productEntity) async {
// //     final isExist = _cartEntity.isExist(productEntity);
// //     final cartItem = _cartEntity.getCartItem(productEntity);

// //     if (isExist && cartItem != null) {
// //       final updatedItem = cartItem.increaseQuantity();
// //       _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //       emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
// //       log("Product quantity increased: ${updatedItem.productEntity.name}");
// //     } else {
// //       final newCartItem = CartItemEntity(
// //         1,
// //         cartId: const Uuid().v4(),
// //         productEntity: productEntity,
// //       );
// //       _cartEntity = _cartEntity.addCartItem(newCartItem);
// //       emit(CartItemAdded(newCartItem, "تم إضافة المنتج إلى السلة"));
// //       log("Product added to cart: ${newCartItem.productEntity.name}");
// //     }
// //     await _syncCartWithFirestore();
// //   }

// //   Future<void> deleteCartItem(CartItemEntity cartItem) async {
// //     _cartEntity = _cartEntity.removeCartItem(cartItem);
// //     emit(CartItemRemoved(cartItem, "تم إزالة المنتج من السلة"));
// //     log("Product removed from cart: ${cartItem.productEntity.name}");
// //     await _syncCartWithFirestore();
// //   }

// //   Future<void> clearCart() async {
// //     _cartEntity = const CartEntity([]);
// //     emit(CartCleared());
// //     log("Cart cleared");
// //     await _syncCartWithFirestore();
// //   }

// //   Future<void> updateQuantity(CartItemEntity cartItem, int newQuantity) async {
// //     if (newQuantity < 1) return;

// //     final updatedItem = cartItem.copyWith(quantity: newQuantity);
// //     _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
// //     log(
// //       "Product quantity updated: ${updatedItem.productEntity.name}, new quantity: $newQuantity",
// //     );
// //     await _syncCartWithFirestore();
// //   }

// //   bool isProductInCart(String productId) {
// //     return _cartEntity.cartItems.any(
// //       (item) => item.productEntity.productId == productId,
// //     );
// //   }

// //   Future<void> _syncCartWithFirestore() async {
// //     final user = FirebaseAuth.instance.currentUser;
// //     if (user == null || _cartEntity.cartItems.isEmpty) {
// //       log("Cart sync skipped (user not logged in or cart is empty)");
// //       return;
// //     }

// //     final cartModels = _cartEntity.cartItems
// //         .map((cartItemEntity) => CartItemModel.fromEntity(cartItemEntity))
// //         .toList();

// //     final result = await cartRepo.updateUserCart(
// //       userModle: UserModel.fromFirebaseUser(user),
// //       cartItems: cartModels,
// //     );

// //     result.fold(
// //       (failure) {
// //         log("Error syncing cart: ${failure.message}");
// //         emit(CartSyncError(failure.message));
// //       },
// //       (_) {
// //         log("Cart synced with Firestore");
// //       },
// //     );
// //   }
// // }

// // extension FirebaseAuthExtension on FirebaseAuth {
// //   bool currentUserIsLoggedIn() {
// //     return currentUser != null;
// //   }
// // }

// // import 'cart_cubit.dart';

// class CartCubit extends Cubit<CartState> {
//   final CartRepo cartRepo;

//   CartCubit(this.cartRepo) : super(CartInitial());

//   CartEntity _cartEntity = const CartEntity([]);

//   List<CartItemEntity> get cartItems => _cartEntity.cartItems;

//   double get totalPrice => _cartEntity.calculateTotalPrice();

//   void addProductWithAuthCheck(ProductEntity productEntity) {
//     if (!FirebaseAuthExtension(FirebaseAuth.instance).currentUserIsLoggedIn()) {
//       emit(CartAuthRequired());
//       return;
//     }
//     addProduct(productEntity);
//   }

//   Future<void> addProduct(ProductEntity productEntity) async {
//     final isExist = _cartEntity.isExist(productEntity);
//     final cartItem = _cartEntity.getCartItem(productEntity);

//     if (isExist && cartItem != null) {
//       final updatedItem = cartItem.increaseQuantity();
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);
//       emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
//       log("Product quantity increased: ${updatedItem.productEntity.name}");
//     } else {
//       final newCartItem = CartItemEntity(
//         1,
//         cartId: const Uuid().v4(),
//         productEntity: productEntity,
//       );
//       _cartEntity = _cartEntity.addCartItem(newCartItem);
//       emit(CartItemAdded(newCartItem, "تم إضافة المنتج إلى السلة"));
//       log("Product added to cart: ${newCartItem.productEntity.name}");
//     }
//     await _syncCartWithFirestore();
//   }

//   Future<void> deleteCartItem(CartItemEntity cartItem) async {
//     _cartEntity = _cartEntity.removeCartItem(cartItem);
//     emit(CartItemRemoved(cartItem, "تم إزالة المنتج من السلة"));
//     log("Product removed from cart: ${cartItem.productEntity.name}");
//     await _syncCartWithFirestore();
//   }

//   Future<void> clearCart() async {
//     _cartEntity = const CartEntity([]);
//     emit(CartCleared());
//     log("Cart cleared");
//     await _syncCartWithFirestore();
//   }

//   Future<void> updateQuantity(CartItemEntity cartItem, int newQuantity) async {
//     if (newQuantity < 1) return;

//     final updatedItem = cartItem.copyWith(quantity: newQuantity);
//     _cartEntity = _cartEntity.updateCartItem(updatedItem);
//     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
//     log(
//       "Product quantity updated: ${updatedItem.productEntity.name}, new quantity: $newQuantity",
//     );
//     await _syncCartWithFirestore();
//   }

//   bool isProductInCart(String productId) {
//     return _cartEntity.cartItems.any(
//       (item) => item.productEntity.productId == productId,
//     );
//   }

//   Future<void> _syncCartWithFirestore() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       log("Cart sync skipped (user not logged in)");
//       return;
//     }

//     final cartModels = _cartEntity.cartItems
//         .map((cartItemEntity) => CartItemModel.fromEntity(cartItemEntity))
//         .toList();

//     final result = await cartRepo.updateUserCart(
//       userModle: UserModel.fromFirebaseUser(user),
//       cartItems: cartModels,
//     );

//     result.fold(
//       (failure) {
//         log("Error syncing cart: ${failure.message}");
//         emit(CartSyncError(failure.message));
//       },
//       (_) {
//         log("Cart synced with Firestore");
//       },
//     );
//   }
// }

// extension FirebaseAuthExtension on FirebaseAuth {
//   bool currentUserIsLoggedIn() => currentUser != null;
// }

// import 'dart:developer';
// // import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_state.dart';
// import 'package:grocery_app/features/inner_screens/auth/data/models/user_model.dart';
// import 'package:uuid/uuid.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:grocery_app/Features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart'
// //     hide CartAuthRequired, CartState, CartInitial, CartSyncError;
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
// // import 'package:grocery_app/core/models/user_model.dart';
// import 'package:grocery_app/core/models/cart_item_model.dart';

// import '../../../../domain/entites/cart_entity.dart';
// import '../../../../domain/entites/cart_item_entity.dart';
// // import 'cart_cubit.dart';

// // ----\---- Cubit --------
// class CartCubit extends Cubit<CartState> {
//   final CartRepo cartRepo;
//   CartCubit(this.cartRepo) : super(CartInitial());

//   CartEntity _cartEntity = const CartEntity([]);

//   CartEntity get cartEntity => _cartEntity;
//   List<CartItemEntity> get cartItems => _cartEntity.cartItems;
//   double get totalPrice => _cartEntity.calculateTotalPrice();

//   // ---------------- Methods ----------------

//   void addProductWithAuthCheck(ProductEntity product) {
//     if (!FirebaseAuthExtension(FirebaseAuth.instance).currentUserIsLoggedIn()) {
//       emit(CartAuthRequired());
//       return;
//     }
//     addProduct(product);
//   }

//   Future<void> addProduct(ProductEntity product) async {
//     final isExist = _cartEntity.isExist(product);

//     if (isExist) {
//       final existingItem = _cartEntity.cartItems.firstWhere(
//         (item) => item.productEntity.productId == product.productId,
//       );
//       final updatedItem = existingItem.increaseQuantity();
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);

//       emit(CartUpdated(_cartEntity, message: "تم زيادة الكمية"));
//       log("Increased product qty: ${product.name}");
//     } else {
//       final newItem = CartItemEntity(
//         cartId: const Uuid().v4(),
//         productEntity: product,
//         quantity: 1,
//       );
//       _cartEntity = _cartEntity.addCartItem(newItem);

//       emit(CartUpdated(_cartEntity, message: "تم إضافة المنتج"));
//       log("Added product: ${product.name}");
//     }
//     await _syncCartWithFirestore();
//   }

//   Future<void> removeItem(CartItemEntity item) async {
//     _cartEntity = _cartEntity.removeCartItem(item);
//     emit(CartUpdated(_cartEntity, message: "تم حذف المنتج"));
//     log("Removed product: ${item.productEntity.name}");
//     await _syncCartWithFirestore();
//   }

//   Future<void> clearCart() async {
//     _cartEntity = const CartEntity([]);
//     emit(CartUpdated(_cartEntity, message: "تم تفريغ السلة"));
//     log("Cart cleared");
//     await _syncCartWithFirestore();
//   }

//   Future<void> updateQuantity(CartItemEntity item, int newQuantity) async {
//     if (newQuantity < 1) return;

//     final updatedItem = CartItemEntity(
//       cartId: item.cartId,
//       productEntity: item.productEntity,
//       quantity: newQuantity,
//     );

//     _cartEntity = _cartEntity.updateCartItem(updatedItem);
//     emit(CartUpdated(_cartEntity, message: "تم تحديث الكمية"));
//     log("Updated ${item.productEntity.name} -> $newQuantity");
//     await _syncCartWithFirestore();
//   }

//   bool isProductInCart(String productId) {
//     return _cartEntity.cartItems.any(
//       (item) => item.productEntity.productId == productId,
//     );
//   }

//   // ---------------- Firestore Sync ----------------
//   Future<void> _syncCartWithFirestore() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       log("Sync skipped: no user logged in");
//       return;
//     }

//     final cartModels = _cartEntity.cartItems
//         .map(CartItemModel.fromEntity)
//         .toList();

//     final result = await cartRepo.updateUserCart(
//       userModel: UserModel.fromFirebaseUser(user),
//       cartItems: cartModels,
//     );

//     result.fold(
//       (failure) {
//         log("Sync error: ${failure.message}");
//         emit(CartSyncError(failure.message));
//       },
//       (_) {
//         log("Cart synced successfully ✅");
//       },
//     );
//   }
// }

// // -------- Extension --------
// extension FirebaseAuthExtension on FirebaseAuth {
//   bool currentUserIsLoggedIn() => currentUser != null;
// }

// import 'dart:developer';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
// import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// // import 'package:meta/meta.dart';
// import 'package:uuid/uuid.dart';

// // import '../../../../../core/entities/product_entity.dart';
// // import '../../../domain/entites/cart_entity.dart';
// // import '../../../domain/entites/cart_item_entity.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());

//   CartEntity _cartEntity = const CartEntity([]);

//   CartEntity get cart => _cartEntity;
//   List<CartItemEntity> get items => _cartEntity.cartItems;

//   /// إضافة منتج للسلة
//   void addProduct(ProductEntity productEntity) {
//     if (_cartEntity.isExist(productEntity)) {
//       final existingItem = _cartEntity.getCartItem(productEntity);
//       final updatedItem = existingItem.increaseQuantity();
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);

//       emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
//       log("تم زيادة الكمية للمنتج: ${updatedItem.productEntity.name}");
//     } else {
//       final newItem = CartItemEntity(
//         1,
//         cartId: const Uuid().v4(),
//         productEntity: productEntity,
//       );
//       _cartEntity = _cartEntity.addCartItem(newItem);

//       emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
//       log("تمت إضافة المنتج: ${newItem.productEntity.name}");
//     }
//   }

//   /// حذف عنصر من السلة
//   void deleteCartItem(CartItemEntity cartItem) {
//     _cartEntity = _cartEntity.removeCartItem(cartItem);
//     emit(CartItemRemoved(cartItem, "تمت إزالة المنتج من السلة"));
//     log("تمت إزالة المنتج: ${cartItem.productEntity.name}");
//   }

//   /// تحديث كمية عنصر معين
//   void updateQuantity(CartItemEntity cartItem, int newQuantity) {
//     if (newQuantity < 1) return;

//     final updatedItem = cartItem.copyWith(quantity: newQuantity);
//     _cartEntity = _cartEntity.updateCartItem(updatedItem);

//     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
//     log(
//       "تم تحديث الكمية للمنتج: ${updatedItem.productEntity.name} -> $newQuantity",
//     );
//   }

//   /// تفريغ السلة
//   void clearCart() {
//     _cartEntity = const CartEntity([]);
//     emit(CartCleared());
//     log("تم تفريغ السلة بالكامل");
//   }

//   /// التحقق من وجود منتج
//   bool isProductInCart(String productId) {
//     return _cartEntity.isExist(
//       ProductEntity(
//         productId: productId,
//         name: "",
//         price: 0,
//         imageUrl: "",
//         description: '',
//         quantity: '',
//         category: '',
//         reviews: [],
//         salePrice: null,
//         isOnSale: null,
//         isPiece: null,
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/Features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit(CartRepo cartRepo) : super(CartInitial());

//   CartEntity _cartEntity = const CartEntity([]);

//   CartEntity get cart => _cartEntity;

//   // حساب السعر الكلي للعناصر
//   double get totalPrice => _cartEntity.calculateTotalPrice();
//   List<CartItemEntity> get items => _cartEntity.cartItems;

//   /// إضافة منتج للسلة
//   void addProduct(ProductEntity productEntity) {
//     if (_cartEntity.isExist(productEntity)) {
//       final existingItem = _cartEntity.getCartItem(productEntity);
//       final updatedItem = existingItem.increaseQuantity();
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);

//       emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
//       log("تم زيادة الكمية للمنتج: ${updatedItem.productEntity.name}");
//     } else {
//       final newItem = CartItemEntity(
//         1,
//         cartId: const Uuid().v4(),
//         productEntity: productEntity,
//       );
//       _cartEntity = _cartEntity.addCartItem(newItem);

//       emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
//       log("تمت إضافة المنتج: ${newItem.productEntity.name}");
//     }
//   }

//   /// حذف عنصر من السلة
//   void deleteCartItem(CartItemEntity cartItem) {
//     _cartEntity = _cartEntity.removeCartItem(cartItem);
//     emit(CartItemRemoved(cartItem, "تمت إزالة المنتج من السلة"));
//     log("تمت إزالة المنتج: ${cartItem.productEntity.name}");
//   }

//   void addProductWithAuthCheck(ProductEntity productEntity) {
//     if (!FirebaseAuthExtension(FirebaseAuth.instance).currentUserIsLoggedIn()) {
//       emit(CartAuthRequired());
//       return;
//     }
//     addProduct(productEntity);
//   }

//   /// تحديث كمية عنصر معين
//   void updateQuantity(CartItemEntity cartItem, int newQuantity) {
//     if (newQuantity < 1) return;

//     final updatedItem = cartItem.copyWith(quantity: newQuantity);
//     _cartEntity = _cartEntity.updateCartItem(updatedItem);

//     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
//     log(
//       "تم تحديث الكمية للمنتج: ${updatedItem.productEntity.name} -> $newQuantity",
//     );
//   }

//   /// تفريغ السلة
//   void clearCart() {
//     _cartEntity = const CartEntity([]);
//     emit(CartCleared());
//     log("تم تفريغ السلة بالكامل");
//   }

//   /// التحقق من وجود منتج في السلة
//   bool isProductInCart(String productId) {
//     return _cartEntity.cartItems.any(
//       (item) => item.productEntity.productId == productId,
//     );
//   }
// }

// extension FirebaseAuthExtension on FirebaseAuth {
//   bool currentUserIsLoggedIn() {
//     return currentUser != null;
//   }
// }
class CartCubit extends Cubit<CartState> {
  CartCubit(CartRepo cartRepo) : super(CartInitial());

  CartEntity _cartEntity = const CartEntity([]);

  CartEntity get cart => _cartEntity;

  double get totalPrice => _cartEntity.calculateTotalPrice();
  List<CartItemEntity> get items => _cartEntity.cartItems;

  void addProduct(ProductEntity productEntity) {
    if (_cartEntity.isExist(productEntity)) {
      final existingItem = _cartEntity.getCartItem(productEntity);
      final updatedItem = existingItem.increaseQuantity();
      _cartEntity = _cartEntity.updateCartItem(updatedItem);

      emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
    } else {
      final newItem = CartItemEntity(
        1,
        cartId: const Uuid().v4(),
        productEntity: productEntity,
      );
      _cartEntity = _cartEntity.addCartItem(newItem);

      emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
    }
  }

  /// **دالة جديدة لتقليل كمية المنتج بمقدار واحد**
  void reduceQuantityByOne(String productId) {
    final existingItem = _cartEntity.cartItems.firstWhere(
      (item) => item.productEntity.productId == productId,
      //  orElse: () => null,
    );

    if (existingItem != null) {
      final newQuantity = existingItem.quantity - 1;

      if (newQuantity > 0) {
        final updatedItem = existingItem.copyWith(quantity: newQuantity);
        _cartEntity = _cartEntity.updateCartItem(updatedItem);
        emit(CartItemUpdated(updatedItem, "تم تقليل كمية المنتج"));
      } else {
        _cartEntity = _cartEntity.removeCartItem(existingItem);
        emit(CartItemRemoved(existingItem, "تمت إزالة المنتج من السلة"));
      }
    }
  }

  void deleteCartItem(CartItemEntity cartItem) {
    _cartEntity = _cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved(cartItem, "تمت إزالة المنتج من السلة"));
  }

  void addProductWithAuthCheck(ProductEntity productEntity) {
    if (!FirebaseAuthExtension(FirebaseAuth.instance).currentUserIsLoggedIn()) {
      emit(CartAuthRequired());
      return;
    }
    addProduct(productEntity);
  }

  void updateQuantity(CartItemEntity cartItem, int newQuantity) {
    if (newQuantity < 1) return;

    final updatedItem = cartItem.copyWith(quantity: newQuantity);
    _cartEntity = _cartEntity.updateCartItem(updatedItem);

    emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
  }

  void clearCart() {
    _cartEntity = const CartEntity([]);
    emit(CartCleared());
  }

  bool isProductInCart(String productId) {
    return _cartEntity.cartItems.any(
      (item) => item.productEntity.productId == productId,
    );
  }
}

extension FirebaseAuthExtension on FirebaseAuth {
  bool currentUserIsLoggedIn() {
    return currentUser != null;
  }
}
