import 'package:e_commerce_app/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/helper/cart/cart.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/common/widgets/button/reactive_button.dart';
import 'package:e_commerce_app/core/config/assets/app_vectors.dart';
import 'package:e_commerce_app/data/order/models/order_regestration_req.dart';
import 'package:e_commerce_app/domain/order/entity/product_ordered_entity.dart';
import 'package:e_commerce_app/domain/order/use_cases/order_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({super.key, required this.products});

  final List<ProductOrderedEntity> products;
  final TextEditingController shippingAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('CheckOut'),
      ),
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _shippingField(context),

                    //_shippingField(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReactiveButton(
                        height: 60,
                        onPressed: () {
                          context.read<ButtonCubit>().execute(
                              useCase: OrderRegistrationUseCase(),
                              params: OrderRegestrationReq(
                                  shippingAddress:
                                      shippingAddressController.text,
                                  products: products,
                                  createdDate: DateTime.now().toString(),
                                  itemCount: products.length,
                                  totalPrice: CartHelper.calculateCartSubTotal(
                                      products)));
                        },
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${CartHelper.calculateCartSubTotal(products)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Text(
                              'Place Order',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _shippingField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 3,
        decoration: const InputDecoration(
          // labelText: 'Shipping Address',
          hintText: 'Shipping Address',
        ),
      ),
    );
  }
}
