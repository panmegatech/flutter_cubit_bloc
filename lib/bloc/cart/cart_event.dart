part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final CartItem item;

  AddToCart(this.item);

  @override
  List<Object?> get props => [
        item,
      ];
}

class RemoveFromCart extends CartEvent {
  final String productId;

  RemoveFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class FetchCartData extends CartEvent {}
