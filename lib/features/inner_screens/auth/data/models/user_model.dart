import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    // super.userImage,
    super.createdAt,
    super.userCart,
    super.userWish,
    // super.image,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      createdAt: Timestamp.now(),
      userCart: [],
      userWish: [],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      uId: json['uId'] ?? '',
      // userImage: json['userImage'],
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp)
          : null,
      userCart: List.from(json['userCart'] ?? []),
      userWish: List.from(json['userWish'] ?? []),
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      //  userImage: user.userImage,
      createdAt: user.createdAt,
      userCart: user.userCart,
      userWish: user.userWish,
    );
  }

  Map<String, dynamic> toMap({bool forFirestore = false}) {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      // 'userImage': userImage,
      'createdAt': forFirestore
          ? FieldValue.serverTimestamp()
          : (createdAt is Timestamp
                ? (createdAt as Timestamp).toDate().toIso8601String()
                : createdAt?.toString()),
      'userCart': userCart,
      'userWish': userWish,
    };
  }
}
