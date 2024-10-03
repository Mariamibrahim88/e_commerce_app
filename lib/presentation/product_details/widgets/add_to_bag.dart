import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BasicAppButton(
        height: 60,
        onPressed: () {},
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toString() : productEntity.price.toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text('Add to Bag',
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
