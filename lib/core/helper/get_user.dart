import 'dart:convert';

import '../../constants.dart';
import '../../features/inner_screens/auth/data/models/user_model.dart';
import '../../features/inner_screens/auth/domain/entites/user_entity.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  UserEntity userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
