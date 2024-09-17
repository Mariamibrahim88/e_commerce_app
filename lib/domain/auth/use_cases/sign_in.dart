import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

class SigninUseCase implements Usecase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
