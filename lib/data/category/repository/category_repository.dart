import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/category/data_source/category_firebase_service.dart';
import 'package:e_commerce_app/data/category/models/category.dart';
import 'package:e_commerce_app/domain/category/repository/repository.dart';
import 'package:e_commerce_app/service_locator.dart';

class CategoryRepositoryImp extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();

    return categories.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(
          data.map((e) => CategoryModel.fromMap(e).toEntity()).toList()));
    });
  }
}
