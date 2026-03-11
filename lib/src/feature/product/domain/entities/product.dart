import 'product_dimensions.dart';
import 'product_meta.dart';
import 'product_review.dart';
import 'product_variant.dart';

export 'product_variant.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.description,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.meta,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.thumbnail,
    this.images,
  })  : _variantsOverride = null,
        _imageUrlOverride = null,
        _nameOverride = null,
        _isActiveOverride = null;

  factory Product.legacy({
    required String id,
    required String name,
    required String category,
    required List<ProductVariant> variants,
    String? description,
    String? imageUrl,
    bool isActive = true,
    String? brand,
    double? rating,
    List<String>? tags,
  }) {
    final normalizedId = int.tryParse(
          id.replaceAll(RegExp(r'[^0-9]'), ''),
        ) ??
        0;
    final firstVariant = variants.isNotEmpty ? variants.first : null;
    final price = firstVariant?.price ?? 0.0;
    final salePrice = firstVariant?.salePrice;
    final discountPercentage =
        salePrice != null && price > 0 ? ((price - salePrice) / price * 100) : null;
    final stock = variants.any((v) => v.inStock) ? 1 : 0;
    return Product(
      id: normalizedId,
      title: name,
      category: category,
      price: price,
      description: description,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: firstVariant?.sku,
      weight: null,
      dimensions: null,
      meta: firstVariant?.barcode == null
          ? null
          : ProductMeta(barcode: firstVariant?.barcode),
      warrantyInformation: null,
      shippingInformation: null,
      availabilityStatus: null,
      reviews: null,
      returnPolicy: null,
      minimumOrderQuantity: null,
      thumbnail: imageUrl,
      images: imageUrl == null ? null : <String>[imageUrl],
    )._withOverrides(
      variantsOverride: variants,
      imageUrlOverride: imageUrl,
      nameOverride: name,
      isActiveOverride: isActive,
    );
  }

  final int id;
  final String title;
  final String category;
  final double price;
  final String? description;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final ProductDimensions? dimensions;
  final ProductMeta? meta;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ProductReview>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final String? thumbnail;
  final List<String>? images;

  final List<ProductVariant>? _variantsOverride;
  final String? _imageUrlOverride;
  final String? _nameOverride;
  final bool? _isActiveOverride;

  String get name => _nameOverride ?? title;

  String? get imageUrl {
    final override = _imageUrlOverride?.trim();
    if (override != null && override.isNotEmpty) return override;
    final primary = thumbnail?.trim();
    if (primary != null && primary.isNotEmpty) return primary;
    final list = images ?? const <String>[];
    return list.isNotEmpty ? list.first : null;
  }

  bool get isActive => _isActiveOverride ?? (stock ?? 0) > 0;

  List<ProductVariant> get variants =>
      _variantsOverride ?? _buildVariants();

  List<ProductVariant> _buildVariants() {
    final discount = discountPercentage ?? 0.0;
    final discounted =
        discount > 0 ? (price - (price * discount / 100)) : null;
    final inStock = (stock ?? 0) > 0;
    final categoryValue = category.trim();
    final brandValue = brand?.trim() ?? '';
    final attributes = <VariantAttribute>[
      if (categoryValue.isNotEmpty)
        VariantAttribute(name: 'Category', value: categoryValue),
      if (brandValue.isNotEmpty)
        VariantAttribute(name: 'Brand', value: brandValue),
    ];
    final idStr = id.toString();
    return <ProductVariant>[
      ProductVariant(
        id: 'v_$idStr',
        productId: idStr,
        price: price,
        salePrice: discounted,
        sku: sku,
        barcode: meta?.barcode,
        imageUrl: imageUrl,
        isActive: true,
        inStock: inStock,
        attributes: attributes,
      ),
    ];
  }

  Product _withOverrides({
    required List<ProductVariant> variantsOverride,
    required String? imageUrlOverride,
    required String? nameOverride,
    required bool? isActiveOverride,
  }) {
    return Product._internal(
      id: id,
      title: title,
      category: category,
      price: price,
      description: description,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      dimensions: dimensions,
      meta: meta,
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews,
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      thumbnail: thumbnail,
      images: images,
      variantsOverride: variantsOverride,
      imageUrlOverride: imageUrlOverride,
      nameOverride: nameOverride,
      isActiveOverride: isActiveOverride,
    );
  }

  const Product._internal({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.description,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.meta,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.thumbnail,
    this.images,
    List<ProductVariant>? variantsOverride,
    String? imageUrlOverride,
    String? nameOverride,
    bool? isActiveOverride,
  })  : _variantsOverride = variantsOverride,
        _imageUrlOverride = imageUrlOverride,
        _nameOverride = nameOverride,
        _isActiveOverride = isActiveOverride;
}
