import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/order/models/order_regestration_req.dart';
import 'package:e_commerce_app/domain/order/repository/order.dart';
import 'package:e_commerce_app/usecase/usecase.dart';

import '../../../service_locator.dart';

class OrderRegistrationUseCase
    implements Usecase<Either, OrderRegestrationReq> {
  @override
  Future<Either> call({OrderRegestrationReq? params}) {
    return sl<OrderRepository>().orderRegistration(params!);
  }
}
