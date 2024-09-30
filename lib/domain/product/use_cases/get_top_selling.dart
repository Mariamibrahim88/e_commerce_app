import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/product/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

class GetProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
