import 'package:flutter/material.dart';
import 'package:products/constants/text_constants.dart';
import 'package:products/controllers/products_controller.dart';

import '../models/products.dart';
import '../ui_components/product_tile.dart';
import '../utils/result.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    required ProductsController controller,
    super.key,
  }) : _productsController = controller;

  final ProductsController _productsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(TextConstants.products),
      ),
      body: ValueListenableBuilder(
        valueListenable: _productsController,
        builder: _buildBody,
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    Result<PaginatedProducts>? result,
    Widget? widget,
  ) {
    return switch (result) {
      null => _buildButton(context),
      ResultError<PaginatedProducts>(error: final error) =>
        _buildButton(context, error: error),
      ResultLoading<PaginatedProducts>() => const Center(
          child: CircularProgressIndicator(),
        ),
      ResultSuccess<PaginatedProducts>(value: final value) => ListView.builder(
          itemCount: value.products.length,
          itemBuilder: (context, index) {
            final item = value.products[index];
            return ProductTile(product: item);
          },
        ),
    };
  }

  Widget _buildButton(BuildContext context, {Exception? error}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: _productsController.getItems,
            child: const Text(TextConstants.getItems),
          ),
          if (error != null)
            Text(
              'error: $error',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.red),
            )
        ],
      ),
    );
  }
}
