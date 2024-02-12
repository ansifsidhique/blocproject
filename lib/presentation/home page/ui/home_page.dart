import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/presentation/home%20page/ui/product_widjet.dart';

import '../../../application/home_page/home_bloc.dart';
import '../../../application/home_page/home_event.dart';
import '../../../application/home_page/home_state.dart';
import '../../cartpage/ui/cart_page.dart';
import '../../favorite_page/ui/favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoritePage()),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item Carted")));
        }
        else if (state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item wishlisted")));
        }
      },
      builder: (context, state) {
        // print(state.runtimeType);
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            // print("ff");
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal.shade300,
                title: const Text("Home Page"),
                actions: [
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index) => Productwidjet(
                  productDataModel: successState.product[index],
                  homeBloc: _homeBloc,
                ),
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            );
          default:
            return const SizedBox(
              child: Text("default"),
            );
        }
      },
    );
  }
}
