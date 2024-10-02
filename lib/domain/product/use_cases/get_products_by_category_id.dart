import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/product/repository/product.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

import '../../../service_locator.dart';

class GetProductsByCategoryIdUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByCategoryId(params!);
  }
}
