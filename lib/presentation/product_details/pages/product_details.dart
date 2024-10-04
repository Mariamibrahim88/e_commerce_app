import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/add_to_bag.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_color.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_images.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_price.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_quantity.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_title.dart';
import 'package:e_commerce_app/presentation/product_details/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductQuantityCubit>(
          create: (contexrt) => ProductQuantityCubit(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        appBar: const BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImages(productEntity: productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductTitle(productEntity: productEntity),
                const SizedBox(
                  height: 10,
                ),
                ProductPrice(productEntity: productEntity),
                const SizedBox(
                  height: 10,
                ),
                const SelectedSize(),
                const SizedBox(
                  height: 10,
                ),
                SelectedColor(productEntity: productEntity),
                const SizedBox(
                  height: 10,
                ),
                const ProductQuantity(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
