import 'package:e_commerce_app/common/bloc/products/product_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/products/product_display_state.dart';
import 'package:e_commerce_app/common/widgets/product/product_card.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/domain/product/use_cases/get_top_selling.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDisplayCubit(usecase: sl<GetTopSellingProductsUseCase>())
            ..displayProducts(),
      child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
        builder: (context, state) {
          if (state is ProductDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDisplayLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(context),
                const SizedBox(
                  height: 15,
                ),
                _products(state.products),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _title(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Selling',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'See All',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(products: products[index]);
          }),
    );
  }
}
