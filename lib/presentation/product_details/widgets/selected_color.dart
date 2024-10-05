import 'package:e_commerce_app/common/widgets/button/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_selection_color_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
            context,
            BlocProvider.value(
              value: BlocProvider.of<ProductSelectionColorCubit>(context),
              child: ProductColors(
                productEntity: productEntity,
              ),
            ));
      },
      child: Container(
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
              'Color',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            Row(
              children: [
                BlocBuilder<ProductSelectionColorCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            productEntity.colors[state].rgb[0],
                            productEntity.colors[state].rgb[1],
                            productEntity.colors[state].rgb[2],
                            1),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
