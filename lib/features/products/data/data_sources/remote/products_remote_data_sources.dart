import 'package:elevate_flutter_task/features/products/data/models/product_response/product_response.dart';

abstract class ProductsRemoteDataSources {
  Future<List<ProductResponse>> getProducts();

}