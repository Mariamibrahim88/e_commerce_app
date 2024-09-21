import 'package:e_commerce_app/domain/auth/entity/user.dart';

abstract class UserInfoDisplayState {}

class UserInfoDisplayLoading extends UserInfoDisplayState {}

class UserInfoDisplayLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoDisplayLoaded({required this.user});
}

class UserInfoDisplayError extends UserInfoDisplayState {
  final String message;

  UserInfoDisplayError({required this.message});
}
