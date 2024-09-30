import 'package:e_commerce_app/domain/product/entity/product.dart';

abstract class TopSellingDisplayState {}

class TopSellingDisplayLoading extends TopSellingDisplayState {}

class TopSellingDisplayLoaded extends TopSellingDisplayState {
  final List<ProductEntity> products;

  TopSellingDisplayLoaded({required this.products});
}

class TopSellingDisplayError extends TopSellingDisplayState {
  final String message;

  TopSellingDisplayError(this.message);
}
