import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/order/data_source/order_firebase_service.dart';
import 'package:e_commerce_app/data/order/models/add_cart_req.dart';
import 'package:e_commerce_app/data/order/models/product_ordered.dart';
import 'package:e_commerce_app/domain/order/repository/order.dart';
import 'package:e_commerce_app/service_locator.dart';

class OrderRepositoryImp extends OrderRepository {
  @override
  Future<Either> addToCart(AddCartReq addCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> removeCartProducts(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProducts(id);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }
}
