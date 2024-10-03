import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              const Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.remove,
                  size: 25,
                ),
              ),
              // const SizedBox(
              //   width: 15,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
