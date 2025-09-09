import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../../../../core/errors/failures.dart';
// import '../../../../../core/repos/images_repo/images_repo.dart';
import '../../../domain/entites/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String shippingAddress,
  ) async {
    emit(SignupLoading());
    final Either<Failure, UserEntity> result = await authRepo.signUp(
      email,
      password,
      name,
      shippingAddress,
      () => Timestamp.now(),
    );

    // .signUp(
    //   email,
    //   password,
    //   name,
    // );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
