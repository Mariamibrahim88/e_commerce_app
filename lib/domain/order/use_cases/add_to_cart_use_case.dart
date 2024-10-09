import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/order/models/add_cart_req.dart';

import 'package:e_commerce_app/domain/order/repository/order.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

class AddToCartUseCase implements Usecase<Either, AddCartReq> {
  @override
  Future<Either> call({AddCartReq? params}) {
    return sl<OrderRepository>().addToCart(params!);
  }
}
