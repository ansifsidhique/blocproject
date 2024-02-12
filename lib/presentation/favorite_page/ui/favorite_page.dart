import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Favourite",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),), backgroundColor: Colors.teal
      ),
    );
  }
}
