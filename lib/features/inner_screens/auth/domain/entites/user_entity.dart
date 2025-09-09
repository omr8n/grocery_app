import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';

class UserEntity {
  final String name;
  final String email;
  final String uId;
  // String? userImage;
  // final XFile? image;
  final Timestamp? createdAt;
  final List? userCart, userWish;

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    // this.image,
    // this.userImage,
    this.createdAt,
    this.userCart,
    this.userWish,
  });
}
