import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';

class CartHelper {
  static double calculateCartSubTotal(List<ProductOrderedEntity> products) {
    double subTotalPrice = 0;

    for (var item in products) {
      subTotalPrice += item.totalPrice;
    }

    return subTotalPrice;
  }
}
