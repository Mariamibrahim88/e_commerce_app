import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';
import 'package:flutter/material.dart';

class ProductOrderedCard extends StatelessWidget {
  const ProductOrderedCard({super.key, required this.productOrderedEntity});

  final ProductOrderedEntity productOrderedEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.secondBackground),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                //color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                  ImageDisplayHelper.generateProductImageUrl(
                      productOrderedEntity.productImage),
                )
                    //fit: BoxFit.cover,
                    ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        productOrderedEntity.productTitle,
                      ),
                      const Spacer(),
                      Text('\$${productOrderedEntity.totalPrice}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(text: 'Size - ', children: [
                          TextSpan(
                              text: productOrderedEntity.productSize,
                              style: TextStyle(color: Colors.white))
                        ]),
                      ),
                      const Spacer(),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(text: 'Color - ', children: [
                          TextSpan(
                              text: productOrderedEntity.productColor,
                              style: const TextStyle(color: Colors.white))
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
