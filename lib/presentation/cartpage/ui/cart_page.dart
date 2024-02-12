import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/application/cart_page/cart_bloc.dart';

import '../../../application/cart_page/cart_event.dart';
import '../../../application/cart_page/cart_state.dart';

import '../../home page/ui/product_widjet.dart';
import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Section",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case SuccessState:
              final succesState = state as SuccessState;
              return ListView.builder(
                itemCount: succesState.cartItem.length,
                itemBuilder: (context, index) => CartWidget(
                  productDataModel: succesState.cartItem[index],
                  cartBloc: cartBloc,
                ),
              );
          }
          return Center(
            child: Text('dd'),
          );
        },
      ),
    );
  }
}
