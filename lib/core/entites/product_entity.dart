import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';

import 'review_entity.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String name;
  final String description;
  final double price;
  final XFile? image;
  String? imageUrl;
  final String productId;
  final num avgRating;
  final num ratingCount;
  final String category;
  final String quantity;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.productId,
    required this.quantity,
    required this.name,
    required this.description,
    required this.price,
    required this.reviews,
    required this.category,
    this.image,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  ProductEntity copyWith({
    String? name,
    String? description,
    double? price,
    XFile? image,
    String? imageUrl,
    String? productId,
    num? avgRating,
    num? ratingCount,
    String? category,
    String? quantity,
    List<ReviewEntity>? reviews,
  }) {
    return ProductEntity(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      reviews: reviews ?? this.reviews,
      category: category ?? this.category,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      avgRating: avgRating ?? this.avgRating,
      ratingCount: ratingCount ?? this.ratingCount,
    );
  }

  @override
  List<Object?> get props => [productId];
}
