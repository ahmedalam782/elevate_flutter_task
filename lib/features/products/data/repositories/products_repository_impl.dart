import 'package:dartz/dartz.dart';
import 'package:elevate_flutter_task/core/errors/exception.dart';
import 'package:elevate_flutter_task/features/products/data/data_sources/remote/products_remote_data_sources.dart';
import 'package:elevate_flutter_task/features/products/data/mappers/products_mapper.dart';
import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';
import 'package:elevate_flutter_task/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';

@Singleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSources _productsRemoteDataSources;
  ProductsRepositoryImpl(
    this._productsRemoteDataSources,
  );
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await _productsRemoteDataSources.getProducts();
      final List<ProductEntity> tasks =
          response.map((e) => e.toEntity()).toList();
      return Right(tasks);
    } on AppException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
