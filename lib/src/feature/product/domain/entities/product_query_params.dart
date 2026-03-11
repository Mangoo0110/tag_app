class ProductQueryParams {
  const ProductQueryParams({
    this.query,
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.page = 1,
    this.limit = 20,
    this.onlyActive = true,
  });

  final String? query;
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final int page;
  final int limit;
  final bool onlyActive;
}
