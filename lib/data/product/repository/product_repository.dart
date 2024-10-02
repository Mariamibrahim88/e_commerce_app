import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/product/data_source/product_firebase_service.dart';
import 'package:e_commerce_app/data/product/models/product.dart';
import 'package:e_commerce_app/domain/product/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class ProductRepositoryImp extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
