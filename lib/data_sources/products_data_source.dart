import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/products.dart';

part 'products_data_source.g.dart';

final productsDataSource = ProductsDataSource(Dio());

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ProductsDataSource {
  factory ProductsDataSource(Dio dio, {String baseUrl}) = _ProductsDataSource;

  @GET('/products')
  Future<PaginatedProducts> getProducts();
}
