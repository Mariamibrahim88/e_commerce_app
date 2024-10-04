import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantityCubit extends Cubit<int> {
  int quantity = 1;

  ProductQuantityCubit() : super(1);

  void increment() {
    quantity++;
    emit(quantity);
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      emit(quantity);
    }
  }
}
