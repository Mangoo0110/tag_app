import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_review.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final images = (product.images ?? const <String>[])
        .where((e) => e.trim().isNotEmpty)
        .toList();
    final primaryImage = product.imageUrl;
    if (primaryImage != null &&
        primaryImage.isNotEmpty &&
        !images.contains(primaryImage)) {
      images.insert(0, primaryImage);
    }
    final variant = product.variants.isNotEmpty ? product.variants.first : null;
    final price = variant?.effectivePrice ?? product.price;
    final original = variant?.salePrice != null ? variant?.price : null;
    final rating = product.rating;
    final stock = product.stock ?? 0;
    final tags = product.tags ?? const <String>[];
    final reviews = product.reviews ?? const <ProductReview>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ImageGallery(images: images),
          const SizedBox(height: 16),
          Text(
            product.name,
            maxLines: 3,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                '৳${price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              if (original != null) ...[
                const SizedBox(width: 8),
                Text(
                  '৳${original.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
              const Spacer(),
              if (rating != null)
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(rating.toStringAsFixed(1)),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(label: product.category),
              if ((product.brand ?? '').isNotEmpty)
                _InfoChip(label: product.brand!),
              _InfoChip(
                label: stock > 0 ? 'In stock ($stock)' : 'Out of stock',
              ),
              if ((product.availabilityStatus ?? '').isNotEmpty)
                _InfoChip(label: product.availabilityStatus!),
            ],
          ),
          if (product.description != null &&
              product.description!.trim().isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              product.description!,
              maxLines: 100,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in tags)
                  Chip(
                    label: Text(tag),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          _DetailsSection(product: product),
          if (reviews.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Top Review',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _ReviewCard(review: reviews.first),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ImageGallery extends StatelessWidget {
  const _ImageGallery({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Icon(Icons.image, size: 64, color: Colors.grey),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final rows = <MapEntry<String, String>>[
      if (product.sku != null && product.sku!.isNotEmpty)
        MapEntry('SKU', product.sku!),
      if (product.weight != null) MapEntry('Weight', '${product.weight}'),
      if (product.dimensions != null)
        MapEntry(
          'Dimensions',
          '${product.dimensions!.width} x ${product.dimensions!.height} x ${product.dimensions!.depth}',
        ),
      if (product.warrantyInformation != null &&
          product.warrantyInformation!.isNotEmpty)
        MapEntry('Warranty', product.warrantyInformation!),
      if (product.shippingInformation != null &&
          product.shippingInformation!.isNotEmpty)
        MapEntry('Shipping', product.shippingInformation!),
      if (product.returnPolicy != null && product.returnPolicy!.isNotEmpty)
        MapEntry('Return', product.returnPolicy!),
      if (product.minimumOrderQuantity != null)
        MapEntry('Min Order', '${product.minimumOrderQuantity}'),
    ];

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...rows.map(
          (row) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(
                  width: 110,
                  child: Text(
                    row.key,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
                Expanded(child: Text(row.value)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ProductReview review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text('${review.rating}/5'),
              const Spacer(),
              Text(
                '${review.date.toLocal()}'.split(' ').first,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(review.comment),
          const SizedBox(height: 8),
          Text(
            review.reviewerName,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
