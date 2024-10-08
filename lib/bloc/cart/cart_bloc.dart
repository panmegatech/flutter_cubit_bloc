import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<FetchCartData>(_onFetchCartData);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    

    final updatedItems = List<CartItem>.from(state.items);

    log("updatedItems: $updatedItems");

    
    final existingItemIndex = updatedItems
        .indexWhere((item) => item.productId == event.item.productId);

    if (existingItemIndex >= 0) {
      log('existingItemIndex item: ${event.item.name}'); 
      
      
      updatedItems[existingItemIndex] =
          updatedItems[existingItemIndex].copyWith(
        quantity: updatedItems[existingItemIndex].quantity + 1,
      );
    } else {
      log('empty item: ${event.item.name}'); 
      
      updatedItems.add(event.item);
    }

    
    double totalPrice = updatedItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));

    
    emit(state.copyWith(items: updatedItems, totalPrice: totalPrice));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems =
        state.items.where((item) => item.productId != event.productId).toList();
    double totalPrice = updatedItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
    emit(state.copyWith(items: updatedItems, totalPrice: totalPrice));
  }

  Future<void> _onFetchCartData(
      FetchCartData event, Emitter<CartState> emit) async {
    log("fetching. .");

    emit(state.copyWith(isLoading: true, isError: false));

    try {
      
      await Future.delayed(const Duration(milliseconds: 800));

      
      //   final List<CartItem> cartItems = [
      //     const CartItem(
      //         productId: '1', name: 'Apple', price: 10.0, quantity: 1),
      //     const CartItem(
      //         productId: '2', name: 'Banana', price: 20.0, quantity: 2),
      //   ];

      //   double totalPrice = cartItems.fold(
      //       0.0, (sum, item) => sum + (item.price * item.quantity));
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          message: 'Error fetching cart data'));
    }
  }
}
