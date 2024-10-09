import '../../../domain/order/entity/product_ordered_entity.dart';

abstract class CartProductsDisplayState {}

class CartProuctLoading extends CartProductsDisplayState {}

class CartProuctLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> cartProducts;

  CartProuctLoaded({required this.cartProducts});
}

class CartProuctFailure extends CartProductsDisplayState {
  final String errMessage;

  CartProuctFailure({required this.errMessage});
}
