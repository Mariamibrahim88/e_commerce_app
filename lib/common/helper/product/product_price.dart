import 'package:e_commerce_app/domain/product/entity/product.dart';

class ProductPriceHelper {
  static double productCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}
