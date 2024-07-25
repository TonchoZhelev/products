import 'package:flutter/material.dart';
import 'package:products/controllers/products_controller.dart';
import 'package:products/data_sources/products_data_source.dart';

import 'views/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Since we aren't using package Provider, or anything like it,
  // we need to keep a static reference to the controller, so that it doesn't
  // get recreated every time on hot reload
  static final productsController = ProductsController(productsDataSource);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductsPage(
        controller: productsController,
      ),
    );
  }
}
