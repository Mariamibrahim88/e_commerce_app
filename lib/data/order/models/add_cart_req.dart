class AddCartReq {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  AddCartReq(
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
}
