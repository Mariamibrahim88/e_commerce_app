import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:e_commerce_app/domain/category/use_cases/categories_use_case.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoading());

  void displayCategories() async {
    emit(CategoriesDisplayLoading());

    var returnedData = await sl<GetCategoriesUseCase>().call();

    returnedData.fold((error) {
      emit(CategoriesDisplayError(error));
    }, (data) {
      List<CategoryEntity> categories = data.cast<CategoryEntity>();
      emit(CategoriesDisplayLoaded(categories: categories));
    });
  }
}
