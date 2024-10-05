import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeCubit extends Cubit<int> {
  ProductSizeCubit() : super(0);

  int selectedSize = 0;
  void selectSizefun(int sizeIndex) {
    selectedSize = sizeIndex;
    emit(selectedSize);
  }
}
