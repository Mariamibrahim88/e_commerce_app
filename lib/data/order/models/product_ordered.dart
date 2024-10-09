import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  ProductOrderedModel(
      {required this.productId,
      required this.productTitle,
      required this.productQuantity,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createdDate});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'title': productTitle,
      'productQuantity': productQuantity,
      'colors': productColor,
      'sizes': productSize,
      'price': productPrice,
      'totalPrice': totalPrice,
      'images': productImage,
      'createdData': createdDate,
    };
  }

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['title'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['colors'] as String,
      productSize: map['sizes'] as String,
      productPrice: map['price'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['images'] as String,
      createdDate: map['createdData'] as String,
      //id: map['id'] as String,
    );
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
        productId: productId,
        productTitle: productTitle,
        productQuantity: productQuantity,
        productColor: productColor,
        productSize: productSize,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createdDate: createdDate);
  }
}
