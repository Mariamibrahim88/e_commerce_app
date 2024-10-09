import 'package:e_commerce_app/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/helper/product/product_price.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/common/widgets/button/reactive_button.dart';
import 'package:e_commerce_app/data/order/models/add_cart_req.dart';
import 'package:e_commerce_app/domain/order/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/cart/pages/cart.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_selection_color_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/bloc/product_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonLoaded) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonLoadFailure) {
          var snackbar = SnackBar(
            content: Text(
              state.message,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ReactiveButton(
          height: 60,
          onPressed: () {
            context.read<ButtonCubit>().execute(
                useCase: AddToCartUseCase(),
                params: AddCartReq(
                    productId: productEntity.productId,
                    productTitle: productEntity.title,
                    productQuantity: context.read<ProductQuantityCubit>().state,
                    productColor: productEntity
                        .colors[
                            context.read<ProductSelectionColorCubit>().state]
                        .title,
                    productSize: productEntity
                        .sizes[context.read<ProductSizeCubit>().state],
                    productPrice: productEntity.price.toDouble(),
                    totalPrice:
                        ProductPriceHelper.productCurrentPrice(productEntity) *
                            context.read<ProductQuantityCubit>().state,
                    productImage: productEntity.images[0],
                    createdDate: DateTime.now().toString()));
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  var price =
                      ProductPriceHelper.productCurrentPrice(productEntity) *
                          state;
                  return Text(
                    '\$${price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const Text('Add to Bag',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
