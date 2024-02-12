import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home_page/home_bloc.dart';

import '../../../application/home_page/home_event.dart';
import '../../../application/home_page/home_state.dart';

import '../../cartpage/ui/cart_page.dart';
import '../../favorite_page/ui/favorite_page.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  final HomeBloc _homeBloc = HomeBloc();
  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FavoritePage()));
        }
      },
      builder: (context, state) {
       switch(state.runtimeType){
         case HomeLoadingState:
           return Scaffold(
             body: Center(
               child: CircularProgressIndicator(),
             ),
           );
         case HomeLoadedSuccessState:
           return  Scaffold(
             appBar: AppBar(
               title: const Text("Sample"),
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
           );
         case HomeErrorState:
           return Scaffold(
             body: Center(
               child:
               Text("error found"),
             ),
           );
         default :
           return SizedBox();
       }
      },
    );
  }
}
