import 'package:elevate_flutter_task/core/network/remote/end_point.dart';

import 'rating.dart';

class ProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      id: json[ApiKey.id] as int?,
      title: json[ApiKey.title] as String?,
      price: (json[ApiKey.price] as num?)?.toDouble(),
      description: json[ApiKey.description] as String?,
      category: json[ApiKey.category] as String?,
      image: json[ApiKey.image] as String?,
      rating: json[ApiKey.rating] == null
          ? null
          : Rating.fromJson(json[ApiKey.rating] as Map<String, dynamic>),
    );
  }
}
