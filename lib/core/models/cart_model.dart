import 'package:grocery_app/core/models/cart_item_model.dart';
import 'package:grocery_app/features/cart/domain/entites/cart_entity.dart';

class CartModel {
  final List<CartItemModel> cartItems;

  CartModel({required this.cartItems});

  // تحويل CartModel إلى CartEntity
  CartEntity toEntity() {
    return CartEntity(cartItems.map((e) => e.toEntity()).toList());
  }

  // تحويل CartEntity إلى CartModel
  factory CartModel.fromEntity(CartEntity cartEntity) {
    return CartModel(
      cartItems: cartEntity.cartItems
          .map((item) => CartItemModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'cartItems': cartItems.map((e) => e.toJson()).toList()};
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartItems: (json['cartItems'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }
}
