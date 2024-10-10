import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';
import 'package:e_commerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  ),
                  fit: BoxFit.cover,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(text: 'Size - ', children: [
                          TextSpan(
                              text: productOrderedEntity.productSize,
                              style: const TextStyle(color: Colors.white))
                        ]),
                      ),
                      //const Spacer(),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(text: 'Color - ', children: [
                          TextSpan(
                              text: productOrderedEntity.productColor,
                              style: const TextStyle(color: Colors.white))
                        ]),
                      ),
                      Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(text: 'Quantity - ', children: [
                          TextSpan(
                              text: productOrderedEntity.productQuantity
                                  .toString(),
                              style: const TextStyle(color: Colors.white))
                        ]),
                      ),

                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CartProductsDisplayCubit>()
                                .removeCartProducts(productOrderedEntity);
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
