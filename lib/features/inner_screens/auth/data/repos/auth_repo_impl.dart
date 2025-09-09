// import 'dart:convert';
import 'dart:convert';
import 'dart:developer';

// import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/errors/exceptions.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../../constants.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/data_service.dart';
import '../../../../../core/services/firebase_auth_service.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/backend_endpoint.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, UserEntity>> signUp(
    String email,
    String password,
    String name,
    String shippingAddress,
    // XFile imageFile,
    // String? userImage,
    Timestamp Function() createdAt, // رابط الصورة المرفوعة
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // أنشئ كيان المستخدم مع رابط الصورة وليس الملف المحلي
      final userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        //  userImage: userImage,
        createdAt: createdAt(), // ✅ استدعاء الدالة
      );

      // خزّن بيانات المستخدم في Firestore (أو أي DB تستخدمها)
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signUp: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
    }
  }

  // @override
  // Future<Either<Failure, UserEntity>> signUp(
  //   String email,
  //   String password,
  //   String name,
  //   XFile imageFile,
  //   String? userImage,
  // ) async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // ✅ إنشاء كيان المستخدم
  //     final userEntity = UserEntity(
  //       image: imageFile,
  //       name: name,
  //       email: email,
  //       uId: user.uid,
  //       //  image: imageUrl, // تأكد أن لديك هذا الحقل في `UserEntity`
  //     );

  //     await addUserData(user: userEntity);
  //     return right(userEntity);
  //   } on CustomException catch (e) {
  //     await deleteUser(user);
  //     return left(ServerFailure(e.message));
  //   } catch (e) {
  //     await deleteUser(user);
  //     log('Exception in AuthRepoImpl.signUp: ${e.toString()}');
  //     return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة أخرى.'));
  //   }
  // }

  // Future<void> deleteUser(User? user) async {
  //   if (user != null) {
  //     await firebaseAuthService.deleteUser();
  //   }
  // }
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User user;
    try {
      user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // @override
  // Future<Either<Failure, UserEntity>> signinWithGoogle() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithGoogle();

  //     UserEntity userEntity = UserModel.fromFirebaseUser(user);
  //     await addUserData(user: userEntity);
  //     bool isUserExist = await databaseService.checkIfDataExists(
  //       path: BackendEndpoint.isUserExists,
  //       documentId: user.uid,
  //     );
  //     if (isUserExist) {
  //       //  await getUserData(uid: user.uid);
  //     } else {
  //       //    await addUserData(user: userEntity);
  //     }

  //     return right(userEntity);
  //   } catch (e) {
  //     await deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
  //   }
  // }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // @override
  // Future<Either<Failure, UserEntity>> signinWithFacebook() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithFacebook();
  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     //  await addUserData(user: userEntity);
  //     return right(userEntity);
  //   } catch (e) {
  //     // await deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
  //   }
  // }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  // @override
  // Future<Either<Failure, UserEntity>> signinWithApple() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithApple();

  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     await addUserData(user: userEntity);
  //     return right(userEntity);
  //   } catch (e) {
  //     await deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(
  //       ServerFailure(
  //         'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
  //       ),
  //     );
  //   }
  // }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(forFirestore: true),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUsersData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    String jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  Future<bool> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Prefs.remove(kUserData); // حذف بيانات المستخدم من التخزين المحلي
      return true;
    } catch (e) {
      ('Error signing out: $e');
      return false;
    }
  }
}
