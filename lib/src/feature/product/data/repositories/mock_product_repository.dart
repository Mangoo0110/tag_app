import 'package:async_handler/async_handler.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/entities/product_query_params.dart';
import '../../domain/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  MockProductRepository({
    this.simulatedLatency = const Duration(milliseconds: 250),
  });

  final Duration simulatedLatency;

  static final List<Product> _products = [
    Product(
      id: 1,
      title: 'Fresh Spinach',
      category: 'c1',
      price: 1.99,
      description: 'Fresh green spinach bunch.',
      discountPercentage: 20.1,
      stock: 18,
      thumbnail:
          'https://www.citypng.com/public/uploads/preview/vegetable-salad-spinach-leaf-hd-png-7040816948632195a90wtaeu8.png',
      images: [
        'https://www.citypng.com/public/uploads/preview/vegetable-salad-spinach-leaf-hd-png-7040816948632195a90wtaeu8.png',
      ],
    ),
    Product(
      id: 2,
      title: 'Carrots',
      category: 'c1',
      price: 0.99,
      description: 'Crunchy orange carrots.',
      stock: 24,
      thumbnail:
          'https://img.favpng.com/25/8/16/carrot-fresh-orange-carrot-GQfSkVKQ_t.jpg',
      images: [
        'https://img.favpng.com/25/8/16/carrot-fresh-orange-carrot-GQfSkVKQ_t.jpg',
      ],
    ),
    Product(
      id: 3,
      title: 'Red Apples',
      category: 'c2',
      price: 2.49,
      description: 'Sweet and crisp apples.',
      stock: 12,
      thumbnail:
          'https://pngdownload.io/wp-content/uploads/2023/12/Fresh-Red-Apples-crisp-and-juicy-fruit-natural-goodness-transparent-png-jpg-300x300.webp',
      images: [
        'https://pngdownload.io/wp-content/uploads/2023/12/Fresh-Red-Apples-crisp-and-juicy-fruit-natural-goodness-transparent-png-jpg-300x300.webp',
      ],
    ),
    Product(
      id: 4,
      title: 'Bananas',
      category: 'c2',
      price: 1.29,
      description: 'Naturally sweet bananas.',
      stock: 34,
      thumbnail:
          'https://e7.pngegg.com/pngimages/595/523/png-clipart-six-ripe-banana-juice-banana-powder-flavor-fruit-yellow-bananas-natural-foods-food-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/595/523/png-clipart-six-ripe-banana-juice-banana-powder-flavor-fruit-yellow-bananas-natural-foods-food-thumbnail.png',
      ],
    ),
    Product(
      id: 5,
      title: 'Whole Milk',
      category: 'c3',
      price: 2.99,
      description: 'Rich and creamy milk.',
      discountPercentage: 16.7,
      stock: 22,
      thumbnail:
          'https://e7.pngegg.com/pngimages/397/314/png-clipart-clear-glass-pitcher-raw-milk-soy-milk-buttermilk-hemp-milk-milk-spray-food-lactose-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/397/314/png-clipart-clear-glass-pitcher-raw-milk-soy-milk-buttermilk-hemp-milk-milk-spray-food-lactose-thumbnail.png',
      ],
    ),
    Product(
      id: 6,
      title: 'Greek Yogurt',
      category: 'c3',
      price: 3.59,
      description: 'Creamy, protein-rich yogurt.',
      stock: 10,
      thumbnail:
          'https://e7.pngegg.com/pngimages/420/834/png-clipart-yogurt-greek-cuisine-food-fat-yogurt-food-cream-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/420/834/png-clipart-yogurt-greek-cuisine-food-fat-yogurt-food-cream-thumbnail.png',
      ],
    ),
    Product(
      id: 7,
      title: 'Cheddar Cheese',
      category: 'c3',
      price: 4.49,
      description: 'Aged cheddar cheese block.',
      stock: 8,
      thumbnail:
          'https://e7.pngegg.com/pngimages/308/1001/png-clipart-cheese-cheddar-cheese-processed-cheese-cheese-torte-cheese-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/308/1001/png-clipart-cheese-cheddar-cheese-processed-cheese-cheese-torte-cheese-thumbnail.png',
      ],
    ),
    Product(
      id: 8,
      title: 'Potato Chips',
      category: 'c4',
      price: 1.49,
      description: 'Crispy salted potato chips.',
      stock: 45,
      thumbnail:
          'https://e7.pngegg.com/pngimages/765/171/png-clipart-potato-chips-potato-chip-junk-food-potato-chips-food-processed-food-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/765/171/png-clipart-potato-chips-potato-chip-junk-food-potato-chips-food-processed-food-thumbnail.png',
      ],
    ),
    Product(
      id: 9,
      title: 'Chocolate Cookies',
      category: 'c4',
      price: 2.89,
      description: 'Soft-baked chocolate cookies.',
      stock: 16,
      thumbnail:
          'https://e7.pngegg.com/pngimages/785/206/png-clipart-chocolate-chip-cookie-chocolate-chip-cookie-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/785/206/png-clipart-chocolate-chip-cookie-chocolate-chip-cookie-thumbnail.png',
      ],
    ),
    Product(
      id: 10,
      title: 'Whole Wheat Bread',
      category: 'c5',
      price: 2.19,
      description: 'Healthy whole wheat bread.',
      stock: 14,
      thumbnail:
          'https://e7.pngegg.com/pngimages/477/80/png-clipart-bread-bread-baked-goods-food-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/477/80/png-clipart-bread-bread-baked-goods-food-thumbnail.png',
      ],
    ),
    Product(
      id: 11,
      title: 'Croissant',
      category: 'c5',
      price: 1.49,
      description: 'Buttery flaky croissant.',
      stock: 9,
      thumbnail: 'https://picsum.photos/seed/croissant/600/600',
      images: [
        'https://picsum.photos/seed/croissant/600/600',
      ],
    ),
    Product(
      id: 12,
      title: 'Ground Beef',
      category: 'c6',
      price: 6.99,
      description: 'Lean ground beef for cooking.',
      stock: 11,
      thumbnail:
          'https://e7.pngegg.com/pngimages/243/859/png-clipart-beef-meat-beef-meat-food-meat-thumbnail.png',
      images: [
        'https://e7.pngegg.com/pngimages/243/859/png-clipart-beef-meat-beef-meat-food-meat-thumbnail.png',
      ],
    ),
  ];

  @override
  Future<ApiResponse<ProductPage>> getProducts(
    ProductQueryParams params,
  ) async {
    await Future<void>.delayed(simulatedLatency);
    final query = params.query?.trim().toLowerCase() ?? '';
    final filtered = _products.where((product) {
      if (params.onlyActive && !product.isActive) return false;
      if (params.categoryId != null &&
          product.category != params.categoryId) {
        return false;
      }
      if (query.isNotEmpty && !product.name.toLowerCase().contains(query)) {
        return false;
      }
      final minVariantPrice = _minVariantPrice(product.variants);
      if (params.minPrice != null && minVariantPrice < params.minPrice!) {
        return false;
      }
      if (params.maxPrice != null && minVariantPrice > params.maxPrice!) {
        return false;
      }
      return true;
    }).toList();

    final total = filtered.length;
    final start = (params.page - 1) * params.limit;
    if (start >= total) {
      return SuccessResponse<ProductPage>(
        data: ProductPage(
          items: const [],
          page: params.page,
          limit: params.limit,
        ),
      );
    }
    final end = (start + params.limit) > total ? total : (start + params.limit);
    final items = filtered.sublist(start, end);
    return SuccessResponse<ProductPage>(
      data: ProductPage(items: items, page: params.page, limit: params.limit),
    );
  }

  @override
  Future<ApiResponse<Product?>> getProductById(String id) async {
    await Future<void>.delayed(simulatedLatency);
    try {
      final product = _products.firstWhere((p) => p.id.toString() == id);
      return SuccessResponse<Product?>(data: product);
    } catch (error, stackTrace) {
      return ErrorResponse<Product?>(
        message: 'Product not found',
        exception: error is Exception ? error : Exception(error.toString()),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<ApiResponse<List<ProductVariant>>> getVariantsByProductId(
    String productId,
  ) async {
    await Future<void>.delayed(simulatedLatency);
    final product = _products.cast<Product?>().firstWhere(
      (p) => p!.id.toString() == productId,
      orElse: () => null,
    );
    return SuccessResponse<List<ProductVariant>>(
      data: product?.variants ?? <ProductVariant>[],
    );
  }
}

double _minVariantPrice(List<ProductVariant> variants) {
  if (variants.isEmpty) return 0;
  var minPrice = variants.first.effectivePrice;
  for (final variant in variants) {
    final price = variant.effectivePrice;
    if (price < minPrice) minPrice = price;
  }
  return minPrice;
}
