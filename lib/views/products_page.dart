import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/constants/text_constants.dart';
import 'package:products/data_sources/products_data_source.dart';

import '../models/products.dart';
import '../ui_components/product_tile.dart';

final productsDataSource = ProductsDataSource(Dio());

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ValueNotifier<PaginatedProducts?> _products = ValueNotifier(null);

  Future<void> _getItems() async {
    final page = await productsDataSource.getProducts();
    _products.value = page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(TextConstants.products),
      ),
      body: ValueListenableBuilder(
        valueListenable: _products,
        builder: (context, products, widget) {
          if (products == null) {
            return Center(
              child: OutlinedButton(
                onPressed: _getItems,
                child: const Text(TextConstants.getItems),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: products.products.length,
              itemBuilder: (context, index) {
                final item = products.products[index];
                return ProductTile(product: item);
              },
            );
          }
        },
      ),
    );
  }
}
