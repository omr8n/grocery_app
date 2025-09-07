import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../entites/product_entity.dart';
import 'review_model.dart';

Uuid uuid = const Uuid();

class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final String productCategoryName;
  final double price;
  final double salePrice;
  final bool isOnSale;
  final bool isPiece;
  final List<ReviewModel> reviews;
  final num avgRating;
  final num ratingCount;
  final XFile? image;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.productCategoryName,
    required this.price,
    required this.salePrice,
    required this.isOnSale,
    required this.isPiece,
    this.reviews = const [],
    this.avgRating = 0,
    this.ratingCount = 0,
    this.image,
  });

  // ✅ من الـ Entity
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.productId,
      title: entity.name,
      imageUrl: entity.imageUrl ?? '',
      productCategoryName: entity.category,
      price: entity.price,
      salePrice: 0, // ما عندك حقل salePrice بالـ Entity؟ عبي افتراضي
      isOnSale: false,
      isPiece: true,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
      image: entity.image,
    );
  }

  // ✅ من JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      productCategoryName: json['productCategoryName'] ?? '',
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      salePrice: (json['salePrice'] is num)
          ? (json['salePrice'] as num).toDouble()
          : double.tryParse(json['salePrice'].toString()) ?? 0.0,
      isOnSale: json['isOnSale'] ?? false,
      isPiece: json['isPiece'] ?? true,
      reviews: (json['reviews'] is List)
          ? (json['reviews'] as List)
                .map((e) => ReviewModel.fromJson(e))
                .toList()
          : [],
      avgRating: json['avgRating'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      image: null, // من JSON ما في XFile
    );
  }

  // ✅ لتحويل لـ JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'productCategoryName': productCategoryName,
      'price': price,
      'salePrice': salePrice,
      'isOnSale': isOnSale,
      'isPiece': isPiece,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'avgRating': avgRating,
      'ratingCount': ratingCount,
    };
  }

  // ✅ لتحويل إلى Entity
  ProductEntity toEntity() {
    return ProductEntity(
      productId: id,
      name: title,
      description: '', // الأولى ما عندها وصف
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      imageUrl: imageUrl,
      quantity: '0', // الأولى ما فيها كمية
      image: image,
      category: productCategoryName,
      avgRating: avgRating,
      ratingCount: ratingCount,
    );
  }
}
