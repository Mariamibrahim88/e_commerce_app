import 'package:e_commerce_app/common/bloc/products/product_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/products/product_display_state.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/common/widgets/product/product_card.dart';
import 'package:e_commerce_app/core/config/assets/app_vectors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/domain/product/use_cases/get_product_by_title.dart';
import 'package:e_commerce_app/presentation/home/widgets/search_field.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDisplayCubit(usecase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: const BasicAppbar(
          height: 80,
          title: SearchField(enabled: true),
        ),
        body: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDisplayLoaded) {
              return state.products.isEmpty
                  ? _notFound(context)
                  : _products(state.products);
            }
            return _notFound(context);
          },
        ),
      ),
    );
  }

  Widget _notFound(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(AppVectors.search)),
        const SizedBox(
          height: 30,
        ),
        const Text(
          textAlign: TextAlign.center,
          'Sorry, we couldn\'t find any matching result for your Search.',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        BasicAppButton(
          onPressed: () {},
          title: 'Explore Categories',
          width: 120,
          height: 60,
        ),
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(products: products[index]);
      },
    );
  }
}
