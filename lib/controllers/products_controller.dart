import 'package:flutter/foundation.dart';

import '../data_sources/products_data_source.dart';
import '../models/products.dart';
import '../utils/result.dart';

class ProductsController extends ValueNotifier<Result<PaginatedProducts>?> {
  ProductsController(this._productsDataSource) : super(null);

  final ProductsDataSource _productsDataSource;

  Future<void> getItems() async {
    try {
      value = Result.loading();
      final page = await _productsDataSource.getProducts();
      value = Result.success(page);
    } on Exception catch (e) {
      value = Result.error(e);
    }
  }
}
