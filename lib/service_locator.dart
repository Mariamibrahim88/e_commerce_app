import 'package:e_commerce_app/data/auth/data_source/auth_firebase_service.dart';
import 'package:e_commerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/category/data_source/category_firebase_service.dart';
import 'package:e_commerce_app/data/category/repository/category_repository.dart';
import 'package:e_commerce_app/data/product/data_source/product_firebase_service.dart';
import 'package:e_commerce_app/data/product/repository/product_repository.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/auth/use_cases/get_ages.dart';
import 'package:e_commerce_app/domain/auth/use_cases/get_user.dart';
import 'package:e_commerce_app/domain/auth/use_cases/is_logged_in.dart';
import 'package:e_commerce_app/domain/auth/use_cases/reset_email.dart';
import 'package:e_commerce_app/domain/auth/use_cases/sign_in.dart';
import 'package:e_commerce_app/domain/auth/use_cases/sign_up.dart';
import 'package:e_commerce_app/domain/category/repository/repository.dart';
import 'package:e_commerce_app/domain/category/use_cases/categories_use_case.dart';
import 'package:e_commerce_app/domain/product/repository/product.dart';
import 'package:e_commerce_app/domain/product/use_cases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDepencies() async {
  //services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImp());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImp());

  //usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<ResetEmailUseCase>(ResetEmailUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase());
}
