import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSelectionColorCubit extends Cubit<int> {
  ProductSelectionColorCubit() : super(0);

  int selectedColor = 0;
  void selectColorfun(int colorIndex) {
    selectedColor = colorIndex;
    emit(selectedColor);
  }
}
