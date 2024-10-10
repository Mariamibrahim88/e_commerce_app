import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/order/repository/order.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

class RemoveCartProductsUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<OrderRepository>().removeCartProducts(params!);
  }
}
