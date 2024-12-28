import 'package:dartz/dartz.dart';
import 'package:elevate_flutter_task/core/errors/failure.dart';
import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';
import 'package:elevate_flutter_task/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Products {
  final ProductsRepository _productsRepository;
  Products(this._productsRepository);

  Future<Either<Failure, List<ProductEntity>>> call() =>
      _productsRepository.getProducts();
}
