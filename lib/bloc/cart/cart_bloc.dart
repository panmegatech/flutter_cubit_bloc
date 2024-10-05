import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    // การจัดการเหตุการณ์แต่ละประเภท
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<FetchCartData>(_onFetchCartData);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    // สร้างสำเนาของรายการสินค้าปัจจุบัน

    final updatedItems = List<CartItem>.from(state.items);

    log("updatedItems: $updatedItems");

    // ค้นหาตำแหน่งของสินค้าที่จะเพิ่มในตะกร้า
    final existingItemIndex = updatedItems
        .indexWhere((item) => item.productId == event.item.productId);

    if (existingItemIndex >= 0) {
      log('existingItemIndex item: ${event.item.name}'); // ตรวจสอบการเรียกใช้
      // ถ้ามีสินค้านี้ในตะกร้าแล้ว ให้เพิ่มจำนวนขึ้น 1
      updatedItems[existingItemIndex] =
          updatedItems[existingItemIndex].copyWith(
        quantity: updatedItems[existingItemIndex].quantity + 1,
      );
    } else {
      log('empty item: ${event.item.name}'); // ตรวจสอบการเรียกใช้
      // ถ้าไม่มีสินค้าในตะกร้า ให้เพิ่มสินค้าลงไป
      updatedItems.add(event.item);
    }

    // คำนวณราคาสุทธิรวมใหม่
    double totalPrice = updatedItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));

    // ส่งออกสถานะใหม่
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
      //   // จำลองการดึงข้อมูล (ใช้เวลา 2 วินาที)
      await Future.delayed(const Duration(milliseconds: 800));

      //   // จำลองข้อมูลตะกร้า
      //   final List<CartItem> cartItems = [
      //     const CartItem(
      //         productId: '1', name: 'Product 1', price: 10.0, quantity: 1),
      //     const CartItem(
      //         productId: '2', name: 'Product 2', price: 20.0, quantity: 2),
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
