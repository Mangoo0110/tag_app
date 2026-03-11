import 'package:flutter/material.dart';
import 'package:tag_app/src/core/shared/widget/paginated_list.dart';
import '../../post.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final PostController _controller = PostController(postServiceLocator<GetPostsUseCase>());

  @override
  void initState() {
    super.initState();
    _controller.refresh();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedListWidget<String, Post>(
      appBar: AppBar(title: const Text('Posts')),
      pagination: _controller.pagination,
      skeleton: const Center(child: CircularProgressIndicator()),
      skeletonCount: 1,
      isPaginated: true,
      scrollDirection: Axis.vertical,
      builder: (index, post) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: _PostCard(post: post),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final comment = post.firstComment;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withAlpha(50),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            post.body,
            maxLines: 6,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (post.tags != null)
                ...post.tags!.map(
                  (tag) => _TagChip(label: tag),
                ),
            ],
          ),
          if (comment != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                border: Border(top: BorderSide(width: .8, color: Theme.of(context).colorScheme.outline)),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.chat_bubble_outline, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.username?.isNotEmpty == true
                              ? comment.username!
                              : 'User ${comment.userId}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(comment.body),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
