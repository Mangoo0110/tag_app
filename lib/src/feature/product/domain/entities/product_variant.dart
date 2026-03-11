class ProductVariant {
  const ProductVariant({
    required this.id,
    required this.productId,
    required this.price,
    this.salePrice,
    this.sku,
    this.barcode,
    this.imageUrl,
    this.isActive = true,
    this.inStock = true,
    this.attributes = const <VariantAttribute>[],
  });

  final String id;
  final String productId;
  final double price;
  final double? salePrice;
  final String? sku;
  final String? barcode;
  final String? imageUrl;
  final bool isActive;
  final bool inStock;
  final List<VariantAttribute> attributes;

  double get effectivePrice => salePrice ?? price;
}

class VariantAttribute {
  const VariantAttribute({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
