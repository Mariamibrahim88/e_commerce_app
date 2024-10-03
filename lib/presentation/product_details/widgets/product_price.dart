import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toString() : productEntity.price.toString()}',
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
    );
  }
}
