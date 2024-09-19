import 'package:e_commerce_app/data/auth/data_source/auth_firebase_service.dart';
import 'package:e_commerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/auth/use_cases/get_ages.dart';
import 'package:e_commerce_app/domain/auth/use_cases/is_logged_in.dart';
import 'package:e_commerce_app/domain/auth/use_cases/reset_email.dart';
import 'package:e_commerce_app/domain/auth/use_cases/sign_in.dart';
import 'package:e_commerce_app/domain/auth/use_cases/sign_up.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDepencies() async {
  //services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<ResetEmailUseCase>(ResetEmailUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
}
