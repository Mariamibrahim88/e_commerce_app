import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ImageDisplayHelper.generateProductImageUrl(
                    productEntity.images[index])),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        separatorBuilder: (
          context,
          index,
        ) =>
            const SizedBox(
          width: 15,
        ),
        itemCount: productEntity.images.length,
      ),
    );
  }
}
