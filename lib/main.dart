import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart';
import 'ui/product_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductController()..fetchProducts(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Intern Assignment',
      home: ProductListScreen(),
    );
  }
}
