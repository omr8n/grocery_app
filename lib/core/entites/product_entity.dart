// // import 'package:equatable/equatable.dart';

// // import 'package:image_picker/image_picker.dart';

// // import 'review_entity.dart';

// // // ignore: must_be_immutable
// // class ProductEntity extends Equatable {
// //   final String name;
// //   final String description;
// //   final double price;
// //   final XFile? image;
// //   String? imageUrl;
// //   final String productId;
// //   final num avgRating;
// //   final num ratingCount;
// //   final String category;
// //   final String quantity;
// //   final List<ReviewEntity> reviews;
// //   final double salePrice;
// //   final bool isOnSale;
// //   final bool isPiece;
// //   ProductEntity({
// //     required this.salePrice,
// //     required this.isOnSale,
// //     required this.isPiece,
// //     required this.productId,
// //     required this.quantity,
// //     required this.name,
// //     required this.description,
// //     required this.price,
// //     required this.reviews,
// //     required this.category,
// //     required this.image,
// //     required this.imageUrl,
// //     required this.avgRating = 0,
// //     required this.ratingCount = 0,
// //   });

// //   ProductEntity copyWith({
// //     String? name,
// //     String? description,
// //     double? price,
// //     XFile? image,
// //     String? imageUrl,
// //     String? productId,
// //     num? avgRating,
// //     num? ratingCount,
// //     String? category,
// //     String? quantity,
// //     List<ReviewEntity>? reviews,
// //   }) {
// //     return ProductEntity(
// //       productId: productId ?? this.productId,
// //       quantity: quantity ?? this.quantity,
// //       name: name ?? this.name,
// //       description: description ?? this.description,
// //       price: price ?? this.price,
// //       reviews: reviews ?? this.reviews,
// //       category: category ?? this.category,
// //       image: image ?? this.image,
// //       imageUrl: imageUrl ?? this.imageUrl,
// //       avgRating: avgRating ?? this.avgRating,
// //       ratingCount: ratingCount ?? this.ratingCount,
// //       salePrice: salePrice ?? this.salePrice,
// //       isOnSale: isOnSale ?? this.isOnSale,
// //       isPiece: isPiece ?? this.isPiece,
// //     );
// //   }

// //   @override
// //   List<Object?> get props => [productId];
// // }

// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';

// import 'review_entity.dart';

// // ignore: must_be_immutable
// class ProductEntity extends Equatable {
//   final String name;
//   final String description;
//   final double price;
//   final XFile? image;
//   final String? imageUrl;
//   final String productId;
//   final num avgRating;
//   final num ratingCount;
//   final String category;
//   final String quantity;
//   final List<ReviewEntity> reviews;
//   final double salePrice;
//   final bool isOnSale;
//   final bool isPiece;

//   const ProductEntity({
//     required this.salePrice,
//     required this.isOnSale,
//     required this.isPiece,
//     required this.productId,
//     required this.quantity,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.reviews,
//     required this.category,
//     this.image,
//     this.imageUrl,
//     this.avgRating = 0,
//     this.ratingCount = 0,
//   });

//   ProductEntity copyWith({
//     String? name,
//     String? description,
//     double? price,
//     XFile? image,
//     String? imageUrl,
//     String? productId,
//     num? avgRating,
//     num? ratingCount,
//     String? category,
//     String? quantity,
//     List<ReviewEntity>? reviews,
//     double? salePrice,
//     bool? isOnSale,
//     bool? isPiece,
//   }) {
//     return ProductEntity(
//       productId: productId ?? this.productId,
//       quantity: quantity ?? this.quantity,
//       name: name ?? this.name,
//       description: description ?? this.description,
//       price: price ?? this.price,
//       reviews: reviews ?? this.reviews,
//       category: category ?? this.category,
//       image: image ?? this.image,
//       imageUrl: imageUrl ?? this.imageUrl,
//       avgRating: avgRating ?? this.avgRating,
//       ratingCount: ratingCount ?? this.ratingCount,
//       salePrice: salePrice ?? this.salePrice,
//       isOnSale: isOnSale ?? this.isOnSale,
//       isPiece: isPiece ?? this.isPiece,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     productId,
//     name,
//     description,
//     price,
//     image,
//     imageUrl,
//     avgRating,
//     ratingCount,
//     category,
//     quantity,
//     reviews,
//     salePrice,
//     isOnSale,
//     isPiece,
//   ];
// }
//  ignore: must_be_immutable
import 'package:equatable/equatable.dart';

import 'review_entity.dart';

class ProductEntity extends Equatable {
  final String productId;
  final String name;
  final String description;
  final double price;
  // final XFile? image;
  final String? imageUrl;
  final num avgRating;
  final num ratingCount;
  final String category;
  final String quantity;
  final List<ReviewEntity> reviews;
  final double salePrice;
  final bool isOnSale;
  final bool isPiece;

  const ProductEntity({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.reviews,
    required this.salePrice,
    required this.isOnSale,
    required this.isPiece,
    // this.image,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  ProductEntity copyWith({
    String? name,
    String? description,
    double? price,
    // XFile? image,
    String? imageUrl,
    String? productId,
    num? avgRating,
    num? ratingCount,
    String? category,
    String? quantity,
    List<ReviewEntity>? reviews,
    double? salePrice,
    bool? isOnSale,
    bool? isPiece,
  }) {
    return ProductEntity(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      reviews: reviews ?? this.reviews,
      salePrice: salePrice ?? this.salePrice,
      isOnSale: isOnSale ?? this.isOnSale,
      isPiece: isPiece ?? this.isPiece,
      // image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      avgRating: avgRating ?? this.avgRating,
      ratingCount: ratingCount ?? this.ratingCount,
    );
  }

  @override
  List<Object?> get props => [
    productId,
    name,
    description,
    price,
    // image,
    imageUrl,
    avgRating,
    ratingCount,
    category,
    quantity,
    reviews,
    salePrice,
    isOnSale,
    isPiece,
  ];
}
