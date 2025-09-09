// import '../entites/review_entity.dart';

// class ReviewModel {
//   final String name;
//   final String image;
//   final num ratting;
//   final String date;
//   final String reviewDescription;

//   ReviewModel({
//     required this.name,
//     required this.image,
//     required this.ratting,
//     required this.date,
//     required this.reviewDescription,
//   });

//   factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
//     return ReviewModel(
//       name: reviewEntity.name,
//       image: reviewEntity.image,
//       ratting: reviewEntity.ratting,
//       date: reviewEntity.date,
//       reviewDescription: reviewEntity.reviewDescription,
//     );
//   }

//   factory ReviewModel.fromJson(Map<String, dynamic> json) {
//     return ReviewModel(
//       name: json['name'],
//       image: json['image'],
//       ratting: json['ratting'],
//       date: json['date'],
//       reviewDescription: json['reviewDescription'],
//     );
//   }

//   ReviewEntity toEntity() {
//     return ReviewEntity(
//       name: name,
//       image: image,
//       ratting: ratting,
//       date: date,
//       reviewDescription: reviewDescription,
//     );
//   }

//   Map<String, Object> toJson() {
//     return {
//       'name': name,
//       'image': image,
//       'ratting': ratting,
//       'date': date,
//       'reviewDescription': reviewDescription,
//     };
//   }
// }
import '../entites/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  const ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? 0,
      date: json['date'] ?? '',
      reviewDescription: json['reviewDescription'] ?? '',
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      date: date,
      reviewDescription: reviewDescription,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }
}
