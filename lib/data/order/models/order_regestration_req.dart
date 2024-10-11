import 'package:e_commerce_app/data/order/models/product_ordered.dart';
import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';

class OrderRegestrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegestrationReq(
      {required this.products,
      required this.shippingAddress,
      required this.createdDate,
      required this.itemCount,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress
    };
  }
}
