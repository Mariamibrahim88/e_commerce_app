import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/data_source/auth_firebase_service.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }
}
