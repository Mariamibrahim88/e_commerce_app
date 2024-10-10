import 'package:e_commerce_app/common/helper/cart/cart.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../domain/order/entity/product_ordered_entity.dart';

import 'package:flutter/widgets.dart';

class CheckOut extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const CheckOut({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _customRow(
              'Subtotal', '\$${CartHelper.calculateCartSubTotal(products)}'),
          _customRow('Shipping Coast', '\$8'),
          _customRow('Tax', '\$0.0'),
          _customRow(
              'Total', '\$${CartHelper.calculateCartSubTotal(products) + 8}'),
          BasicAppButton(title: 'Checkout', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _customRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 19,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}
