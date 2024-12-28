import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';

abstract class ProductStats {}

class ProductInitial extends ProductStats {}

class ProductLoading extends ProductStats {}

class ProductSuccess extends ProductStats {
  List<ProductEntity> products;
  ProductSuccess({required this.products});
}

class ProductError extends ProductStats {
  String message;
  ProductError({required this.message});
}
