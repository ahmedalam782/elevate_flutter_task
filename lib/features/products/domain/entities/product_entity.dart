class ProductEntity {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final double? rate;
  final int? count;
  final double? priceAfterDiscount;
  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rate,
    this.count,
    this.priceAfterDiscount,
  });
}
