import 'package:dartz/dartz.dart';
import 'package:elevate_flutter_task/core/errors/failure.dart';
import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
