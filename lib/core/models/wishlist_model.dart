import 'package:grocery_app/core/entites/wishlist_entity.dart';

class WishlistModel extends WishlistEntity {
  WishlistModel({required super.id, required super.productId});

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'productId': productId};
  }

  factory WishlistModel.fromEntity(WishlistEntity entity) {
    return WishlistModel(id: entity.id, productId: entity.productId);
  }

  WishlistEntity toEntity() {
    return WishlistEntity(id: id, productId: productId);
  }
}
