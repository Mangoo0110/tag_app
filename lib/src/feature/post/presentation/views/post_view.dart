import 'package:flutter/material.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/process_notifier.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/snackbar_notifier.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.load(
        errorSnackbarNotifier: SnackbarNotifier(context: context),
      );
    });
  }

  @override
  void dispose() {
    _controller.processNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _controller.processNotifier,
        ]),
        builder: (context, _) {
          if (_controller.processNotifier.status is ProcessLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_controller.processNotifier.status is ProcessFailed) {
            return Center(
              child: TextButton(
                onPressed: () {
                  _controller.load(
                    errorSnackbarNotifier: SnackbarNotifier(context: context),
                  );
                },
                child: const Text('Retry'),
              ),
            );
          }
          if (_controller.posts.isEmpty) {
            return const Center(child: Text('No posts found'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: _controller.posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final post = _controller.posts[index];
              return _PostCard(post: post);
            },
          );
        },
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
