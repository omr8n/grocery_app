import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../../../core/errors/failures.dart';

import '../entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp(
    String email,
    String password,
    String name,
    String shippingAddress,

    // XFile imageFile,
    // String imageUrl,
    Timestamp Function() createdAt, // ✅ لاحظ أنها دالة
  );

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
    String email,
    String password,
  );

  //  Future<Either<Failure, UserEntity>> signinWithGoogle();
  // Future<Either<Failure, UserEntity>> signinWithFacebook();

  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
  // // read data from user

  // Future<Either<Failure, UserEntity>> signinWithApple();
}
