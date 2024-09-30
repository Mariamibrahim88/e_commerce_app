import 'package:e_commerce_app/domain/product/use_cases/get_top_selling.dart';
import 'package:e_commerce_app/presentation/home/bloc/top_selling_display_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(TopSellingDisplayLoading());

  void displayTopSellingProducts() async {
    var returnedData = await sl<GetProductsUseCase>().call();

    returnedData.fold((error) {
      emit(TopSellingDisplayError(error));
    }, (data) {
      emit(TopSellingDisplayLoaded(products: data));
    });
  }
}
