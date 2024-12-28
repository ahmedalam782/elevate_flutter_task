import 'package:elevate_flutter_task/core/errors/exception.dart';
import 'package:elevate_flutter_task/core/network/remote/api_consumer.dart';
import 'package:elevate_flutter_task/core/network/remote/end_point.dart';
import 'package:elevate_flutter_task/features/products/data/data_sources/remote/products_remote_data_sources.dart';
import 'package:elevate_flutter_task/features/products/data/models/product_response/product_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductsRemoteDataSources)
class ProductsApiRemoteDataSources implements ProductsRemoteDataSources {
  final ApiConsumer _apiConsumer;

  ProductsApiRemoteDataSources(this._apiConsumer);

  @override
  Future<List<ProductResponse>> getProducts() async {
    try {
      final response = await _apiConsumer.get(
        EndPoint.products,
      );
      final List<ProductResponse>? tasks = (response as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      return tasks ?? [];
    } on ServerException catch (e) {
      String? message = e.errorModel.message;
      throw RemoteException(message ?? 'Failed to get tasks');
    }
  }
}
