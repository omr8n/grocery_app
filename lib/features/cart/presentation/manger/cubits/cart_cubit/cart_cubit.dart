// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:grocery_app/core/entites/product_entity.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// // import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
// // import 'package:uuid/uuid.dart';

// // part 'cart_state.dart';

// // class CartCubit extends Cubit<CartState> {
// //   final CartRepo cartRepo;
// //   CartCubit(this.cartRepo) : super(CartInitial());

// //   CartEntity _cartEntity = const CartEntity([]);
// //   CartEntity get cart => _cartEntity;
// //   List<CartItemEntity> get items => _cartEntity.cartItems;
// //   double get totalPrice => _cartEntity.calculateTotalPrice();

// //   void addProduct(ProductEntity productEntity) {
// //     // if (_cartEntity.isExist(productEntity)) {
// //     //   final existingItem = _cartEntity.getCartItem(productEntity);
// //     //   final updatedItem = existingItem.increaseQuantity();
// //     //   _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //     //   emit(CartItemUpdated(updatedItem, "تم زيادة كمية المنتج"));
// //     // } else {
// //     //   final newItem = CartItemEntity(
// //     //     1,
// //     //     cartId: const Uuid().v4(),
// //     //     productEntity: productEntity,
// //     //   );
// //     //   _cartEntity = _cartEntity.addCartItem(newItem);
// //     //   emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
// //     // }
// //     if (_cartEntity.isExist(productEntity)) {
// //       // ✅ المنتج موجود، ما رح نزيد الكمية
// //       emit(
// //         CartItemUpdated(
// //           _cartEntity.getCartItem(productEntity),
// //           "المنتج موجود مسبقاً في السلة",
// //         ),
// //       );
// //     } else {
// //       final newItem = CartItemEntity(
// //         1,
// //         cartId: const Uuid().v4(),
// //         productEntity: productEntity,
// //       );
// //       _cartEntity = _cartEntity.addCartItem(newItem);
// //       emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
// //     }
// //   }

// //   void reduceQuantityByOne(String productId) {
// //     final index = _cartEntity.cartItems.indexWhere(
// //       (item) => item.productEntity.productId == productId,
// //     );
// //     if (index == -1) return;

// //     final existingItem = _cartEntity.cartItems[index];

// //     if (existingItem.quantity > 1) {
// //       final updatedItem = existingItem.copyWith(
// //         quantity: existingItem.quantity - 1,
// //       );
// //       _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //       emit(CartItemUpdated(updatedItem, "تم تقليل كمية المنتج"));
// //     } else {
// //       final updatedItem = existingItem.copyWith(quantity: 1);
// //       _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //       emit(CartItemUpdated(updatedItem, "الكمية الحد الأدنى هي 1"));
// //     }
// //   }

// //   void deleteCartItem(CartItemEntity cartItem) {
// //     _cartEntity = _cartEntity.removeCartItem(cartItem);
// //     emit(CartItemRemoved(cartItem, "تمت إزالة المنتج من السلة"));
// //   }

// //   void updateQuantity(CartItemEntity cartItem, int newQuantity) {
// //     if (newQuantity < 1) return;
// //     final updatedItem = cartItem.copyWith(quantity: newQuantity);
// //     _cartEntity = _cartEntity.updateCartItem(updatedItem);
// //     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
// //   }

// //   void clearCart() {
// //     _cartEntity = const CartEntity([]);
// //     emit(CartCleared());
// //   }

// //   bool isProductInCart(String productId) {
// //     return _cartEntity.cartItems.any(
// //       (item) => item.productEntity.productId == productId,
// //     );
// //   }

// //   void addProductWithAuthCheck(ProductEntity productEntity) {
// //     if (!FirebaseAuth.instance.currentUserIsLoggedIn()) {
// //       emit(CartAuthRequired());
// //       return;
// //     }
// //     addProduct(productEntity);
// //   }
// // }

// // extension FirebaseAuthExtension on FirebaseAuth {
// //   bool currentUserIsLoggedIn() => currentUser != null;
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
// import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
// import 'package:uuid/uuid.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   final CartRepo cartRepo;
//   CartCubit(this.cartRepo) : super(CartInitial());

//   CartEntity _cartEntity = const CartEntity([]);
//   CartEntity get cart => _cartEntity;
//   List<CartItemEntity> get items => _cartEntity.cartItems;
//   double get totalPrice => _cartEntity.calculateTotalPrice();

//   /// إضافة منتج بكمية ثابتة = 1
//   void addProduct(ProductEntity productEntity) {
//     if (_cartEntity.isExist(productEntity)) {
//       // ✅ المنتج موجود، ما رح نزيد الكمية (نفس سلوكك الحالي)
//       emit(
//         CartItemUpdated(
//           _cartEntity.getCartItem(productEntity),
//           "المنتج موجود مسبقاً في السلة",
//         ),
//       );
//     } else {
//       final newItem = CartItemEntity(
//         1,
//         cartId: const Uuid().v4(),
//         productEntity: productEntity,
//       );
//       _cartEntity = _cartEntity.addCartItem(newItem);
//       emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
//     }
//   }

//   /// إضافة منتج بكمية مخصصة
//   void addProductWithQuantity(ProductEntity productEntity, int quantity) {
//     if (_cartEntity.isExist(productEntity)) {
//       // ✅ إذا المنتج موجود، نضيف الكمية فوق القديمة
//       final existingItem = _cartEntity.getCartItem(productEntity);
//       final updatedItem = existingItem.copyWith(
//         quantity: existingItem.quantity + quantity,
//       );
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);
//       emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
//     } else {
//       // ✅ إذا المنتج جديد، ينضاف بالكمية مباشرة
//       final newItem = CartItemEntity(
//         quantity,
//         cartId: const Uuid().v4(),
//         productEntity: productEntity,
//       );
//       _cartEntity = _cartEntity.addCartItem(newItem);
//       emit(CartItemAdded(newItem, "تمت إضافة المنتج إلى السلة"));
//     }
//   }

//   /// إنقاص الكمية بواحد
//   void reduceQuantityByOne(String productId) {
//     final index = _cartEntity.cartItems.indexWhere(
//       (item) => item.productEntity.productId == productId,
//     );
//     if (index == -1) return;

//     final existingItem = _cartEntity.cartItems[index];

//     if (existingItem.quantity > 1) {
//       final updatedItem = existingItem.copyWith(
//         quantity: existingItem.quantity - 1,
//       );
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);
//       emit(CartItemUpdated(updatedItem, "تم تقليل كمية المنتج"));
//     } else {
//       final updatedItem = existingItem.copyWith(quantity: 1);
//       _cartEntity = _cartEntity.updateCartItem(updatedItem);
//       emit(CartItemUpdated(updatedItem, "الكمية الحد الأدنى هي 1"));
//     }
//   }

//   /// حذف عنصر من السلة
//   void deleteCartItem(CartItemEntity cartItem) {
//     _cartEntity = _cartEntity.removeCartItem(cartItem);
//     emit(CartItemRemoved(cartItem, "تمت إزالة المنتج من السلة"));
//   }

//   /// تحديث الكمية لعدد مخصص
//   void updateQuantity(CartItemEntity cartItem, int newQuantity) {
//     if (newQuantity < 1) return;
//     final updatedItem = cartItem.copyWith(quantity: newQuantity);
//     _cartEntity = _cartEntity.updateCartItem(updatedItem);
//     emit(CartItemUpdated(updatedItem, "تم تحديث كمية المنتج"));
//   }

//   /// مسح السلة بالكامل
//   void clearCart() {
//     _cartEntity = const CartEntity([]);
//     emit(CartCleared());
//   }

//   /// التحقق إذا المنتج موجود في السلة
//   bool isProductInCart(String productId) {
//     return _cartEntity.cartItems.any(
//       (item) => item.productEntity.productId == productId,
//     );
//   }

//   /// إضافة منتج بكمية = 1 مع التحقق من تسجيل الدخول
//   void addProductWithAuthCheck(ProductEntity productEntity) {
//     if (!FirebaseAuth.instance.currentUserIsLoggedIn()) {
//       emit(CartAuthRequired());
//       return;
//     }
//     addProduct(productEntity);
//   }

//   /// إضافة منتج بكمية مخصصة مع التحقق من تسجيل الدخول
//   void addProductWithAuthCheckQuantity(
//     ProductEntity productEntity,
//     int quantity,
//   ) {
//     if (!FirebaseAuth.instance.currentUserIsLoggedIn()) {
//       emit(CartAuthRequired());
//       return;
//     }
//     addProductWithQuantity(productEntity, quantity);
//   }
// }

// extension FirebaseAuthExtension on FirebaseAuth {
//   bool currentUserIsLoggedIn() => currentUser != null;
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
import 'package:grocery_app/core/repos/cart_repo/cart_repo.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  CartEntity _cartEntity = const CartEntity([]);
  CartEntity get cart => _cartEntity;
  List<CartItemEntity> get items => _cartEntity.cartItems;
  double get totalPrice => _cartEntity.calculateTotalPrice();

  void addProduct(ProductEntity productEntity, {int quantity = 1}) {
    final existingItemIndex = _cartEntity.cartItems.indexWhere(
      (item) => item.productEntity.productId == productEntity.productId,
    );

    if (existingItemIndex != -1) {
      // ✅ المنتج موجود → نحدث الكمية
      final existingItem = _cartEntity.cartItems[existingItemIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
      _cartEntity = _cartEntity.updateCartItem(updatedItem);
      emit(
        CartItemUpdated(
          updatedItem,
          //  "تم تحديث الكمية"
        ),
      );
    } else {
      // ✅ منتج جديد → نضيفه
      final newItem = CartItemEntity(
        quantity,
        cartId: const Uuid().v4(),
        productEntity: productEntity,
      );
      _cartEntity = _cartEntity.addCartItem(newItem);
      emit(
        CartItemAdded(
          newItem,
          //  "تمت إضافة المنتج إلى السلة"
        ),
      );
    }
  }

  void updateQuantity(CartItemEntity cartItem, int newQuantity) {
    if (newQuantity < 1) return;
    final updatedItem = cartItem.copyWith(quantity: newQuantity);
    _cartEntity = _cartEntity.updateCartItem(updatedItem);
    emit(
      CartItemUpdated(
        updatedItem,
        //  "تم تحديث كمية المنتج"
      ),
    );
  }

  void deleteCartItem(CartItemEntity cartItem) {
    _cartEntity = _cartEntity.removeCartItem(cartItem);
    emit(
      CartItemRemoved(
        cartItem,
        //  state.toString()
      ),
    );
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

  void addProductWithAuthCheck(
    ProductEntity productEntity, {
    int quantity = 1,
  }) {
    if (!FirebaseAuth.instance.currentUserIsLoggedIn()) {
      emit(CartAuthRequired());
      return;
    }
    addProduct(productEntity, quantity: quantity);
  }
}

extension FirebaseAuthExtension on FirebaseAuth {
  bool currentUserIsLoggedIn() => currentUser != null;
}
