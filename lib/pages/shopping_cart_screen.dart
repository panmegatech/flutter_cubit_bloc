import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';

// สมมุติว่าคุณได้ import คลาส CartBloc, CartState, และ CartEvent ที่เราสร้างไว้ก่อนหน้านี้

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state.items.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }

          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ListTile(
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Price: \$${item.price} x ${item.quantity}',
                  style: const TextStyle(color: Colors.teal),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    // ลบสินค้าจากตะกร้า
                    context
                        .read<CartBloc>()
                        .add(RemoveFromCart(item.productId));
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Text(
                  'Total Price (\$): ${state.totalPrice} ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: state.isLoading
                ? null
                : () {
                    // ตัวอย่างการเพิ่มสินค้าในตะกร้า
                    log("addToCart");
                    context.read<CartBloc>().add(AddToCart(CartItem(
                          productId: randomString(5, onlyNumber: true),
                          name: randomString(5),
                          price:
                              double.parse(randomString(3, onlyNumber: true)),
                          quantity: 1,
                        )));
                    Future.delayed(Duration.zero).then(
                      (value) {
                        context.read<CartBloc>().add(FetchCartData());
                      },
                    );
                  },
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.add_shopping_cart),
          );
        },
      ),
    );
  }
}
