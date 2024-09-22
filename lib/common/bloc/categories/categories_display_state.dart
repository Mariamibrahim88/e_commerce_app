import 'package:e_commerce_app/domain/category/entity/category.dart';

abstract class CategoriesDisplayState {}

class CategoriesDisplayLoading extends CategoriesDisplayState {}

class CategoriesDisplayLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesDisplayLoaded({required this.categories});
}

class CategoriesDisplayError extends CategoriesDisplayState {
  final String message;

  CategoriesDisplayError(this.message);
}
