import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: () {
    //     AppBottomsheet.display(
    //         context,
    //         BlocProvider.value(
    //             value: BlocProvider.of<ProductColorSelectionCubit>(context),
    //             child: ProductColors(
    //               productEntity: productEntity,
    //             )));
    //   },
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
            'Color',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      productEntity.colors.first.rgb[0],
                      productEntity.colors.first.rgb[1],
                      productEntity.colors.first.rgb[2],
                      1),
                  shape: BoxShape.circle,
                ),
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
    );
  }
}
