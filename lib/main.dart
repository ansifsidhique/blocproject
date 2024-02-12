import 'package:flutter/material.dart';

import 'package:untitled4/presentation/home%20page/ui/home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
         primaryColor: Colors.teal
      ),
    );
  }
}

