import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_selection_color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Color',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return BlocBuilder<ProductSelectionColorCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductSelectionColorCubit>()
                            .selectColorfun(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: state == index
                              ? AppColors.primary
                              : AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.colors[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        productEntity.colors[index].rgb[0],
                                        productEntity.colors[index].rgb[1],
                                        productEntity.colors[index].rgb[2],
                                        1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                state == index
                                    ? const Icon(
                                        Icons.done,
                                        size: 30,
                                      )
                                    : Container(
                                        //height: 30,
                                        width: 30,
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: productEntity.colors.length,
            )
          ],
        ),
      ),
    );
  }
}
