import 'package:e_commerce_app/domain/product/entity/product.dart';

abstract class ProductDisplayState {}

class ProductDisplayInitialState extends ProductDisplayState {}

class ProductDisplayLoading extends ProductDisplayState {}

class ProductDisplayLoaded extends ProductDisplayState {
  final List<ProductEntity> products;

  ProductDisplayLoaded({required this.products});
}

class ProductDisplayError extends ProductDisplayState {
  final String message;

  ProductDisplayError(this.message);
}
