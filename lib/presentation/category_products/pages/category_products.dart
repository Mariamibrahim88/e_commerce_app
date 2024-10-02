import 'package:e_commerce_app/common/bloc/products/product_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/products/product_display_state.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/product/product_card.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/domain/product/use_cases/get_products_by_category_id.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) =>
            ProductDisplayCubit(usecase: sl<GetProductsByCategoryIdUseCase>())
              ..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDisplayLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    _title(),
                    const SizedBox(
                      height: 20,
                    ),
                    _products(state.products),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      '${categoryEntity.title} (200)',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
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
