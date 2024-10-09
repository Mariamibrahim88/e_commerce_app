import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/order/repository/order.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

import '../../../service_locator.dart';

class GetCartProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return sl<OrderRepository>().getCartProducts();
  }
}
