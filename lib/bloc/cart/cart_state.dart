part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final double totalPrice;
  final bool isLoading;
  final bool isError;
  final String message;

  const CartState({
    this.items = const [],
    this.totalPrice = 0.0,
    this.isLoading = false,
    this.isError = false,
    this.message = '',
  });

  CartState copyWith({
    List<CartItem>? items,
    double? totalPrice,
    bool? isLoading,
    bool? isError,
    String? message,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice, isLoading, isError, message];
}

class CartItem extends Equatable {
  final String productId;
  final String name;
  final double price;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    String? productId,
    String? name,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [productId, name, price, quantity];
}
