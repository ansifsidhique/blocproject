
import 'package:flutter/material.dart';
import 'package:untitled4/application/home_page/home_bloc.dart';

import '../../../application/home_page/home_event.dart';

class Trail extends StatelessWidget {
   Trail({super.key});
 final HomeBloc  _homeBloc=HomeBloc();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
  }
}
