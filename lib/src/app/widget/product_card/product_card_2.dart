import 'package:flutter/material.dart';
import 'package:tag_app/src/core/themes/app_colors.dart';
import 'package:tag_app/src/feature/product/domain/entities/product.dart';
import 'package:tag_app/src/feature/product/presentation/views/product_detail_view.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final variant = product.variants.isNotEmpty ? product.variants.first : null;
    final price = variant?.effectivePrice ?? 0;
    final original =
        (variant?.salePrice != null) ? variant?.price : null;
    final category = product.category.isNotEmpty ? product.category : null;
    final tagList = product.tags ?? const <String>[];
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: .5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDetailView(product: product),
            ),
          );
        },
        child: Column(
          children: [
            product.imageUrl != null
                ? Image.network(
                    product.imageUrl!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 120,
                    child: Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '৳${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                        ),
                      ),
                      if (original != null) ...[
                        const SizedBox(width: 6),
                        Text(
                          '৳${original.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if ((product.brand ?? '').isNotEmpty)
                        Text(
                          product.brand!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if ((product.brand ?? '').isNotEmpty && category != null)
                        const SizedBox(width: 6),
                      if (category != null)
                        Flexible(
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      const Spacer(),
                      if (product.rating != null)
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 2),
                            Text(
                              product.rating!.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                    ],
                  ),
                  if (tagList.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 6,
                        children: [
                          for (final tag in tagList.take(2))
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary
                                    .withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                  if (variant != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          variant.inStock ? Icons.check_circle : Icons.schedule,
                          size: 12,
                          color:
                              variant.inStock ? Colors.green : Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          variant.inStock ? 'In stock' : 'Limited',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
