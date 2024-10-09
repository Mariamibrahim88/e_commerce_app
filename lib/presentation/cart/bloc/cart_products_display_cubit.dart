import 'package:e_commerce_app/domain/order/use_cases/get_cart_products.dart';
import 'package:e_commerce_app/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProuctLoading());
  void dispalyCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold((error) {
      emit(CartProuctFailure(errMessage: error));
    }, (data) {
      emit(CartProuctLoaded(cartProducts: data));
    });
  }
}
