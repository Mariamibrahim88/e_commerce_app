import 'package:e_commerce_app/common/bloc/products/product_display_state.dart';
import 'package:e_commerce_app/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayCubit extends Cubit<ProductDisplayState> {
  ProductDisplayCubit({required this.usecase})
      : super(ProductDisplayInitialState());

  final Usecase usecase;

  void displayProducts({dynamic params}) async {
    emit(ProductDisplayLoading());
    var returnedData = await usecase.call(
      params: params,
    );

    returnedData.fold((error) {
      emit(ProductDisplayError(error));
    }, (data) {
      emit(ProductDisplayLoaded(products: data));
    });
  }

  void initialDisplay() {
    emit(ProductDisplayInitialState());
  }
}
