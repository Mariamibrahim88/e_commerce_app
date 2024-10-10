import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';
import 'package:e_commerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:e_commerce_app/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:e_commerce_app/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce_app/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..dispalyCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
            builder: (context, state) {
          if (state is CartProuctLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartProuctLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  _buildCartProducts(state.cartProducts),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CheckOut(
                        products: state.cartProducts,
                      )),
                ],
              ),
            );
          }
          if (state is CartProuctFailure) {
            return Text(state.errMessage);
          }
          return const SizedBox();
        }),
      ),
    );
  }

  Widget _buildCartProducts(List<ProductOrderedEntity> products) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index],
        );
      },
    );
  }
}
