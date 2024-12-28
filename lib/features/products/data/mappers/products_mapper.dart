import 'package:elevate_flutter_task/features/products/data/models/product_response/product_response.dart';
import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';

extension ProductMapper on ProductResponse {
  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rate: rating?.rate,
        count: rating?.count,
      );
}
