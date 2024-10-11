import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/order/models/add_cart_req.dart';
import 'package:e_commerce_app/data/order/models/order_regestration_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddCartReq addCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProducts(String id);
  Future<Either> orderRegistration(OrderRegestrationReq order);
}
