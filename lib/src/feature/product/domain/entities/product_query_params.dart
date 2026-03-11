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

  Map<String, dynamic> toMap() {
      return {
        if(query != null) 'query': query,
        if(categoryId != null) 'category': categoryId,
        if(minPrice != null) 'minPrice': minPrice,
        if(maxPrice != null) 'maxPrice': maxPrice,
        'page': page,
        'limit': limit,
        'skip': (page - 1) * limit,
      };
  }

  @override
  String toString() {
    return 'ProductQueryParams(query: $query, categoryId: $categoryId, minPrice: $minPrice, maxPrice: $maxPrice, page: $page, limit: $limit, onlyActive: $onlyActive)';
  }
}
