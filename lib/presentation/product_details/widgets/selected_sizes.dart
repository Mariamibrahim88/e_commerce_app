import 'package:e_commerce_app/common/widgets/button/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_size_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
            context,
            BlocProvider.value(
              value: BlocProvider.of<ProductSizeCubit>(context),
              child: ProductSizes(productEntity: productEntity),
            ));
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.secondBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Size',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              Row(
                children: [
                  BlocBuilder<ProductSizeCubit, int>(
                    builder: (context, state) {
                      return Text(productEntity.sizes[state],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
