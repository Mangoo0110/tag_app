import 'post_comment.dart';

class Post {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    this.tags,
    this.reactionsCount,
    this.firstComment,
  });

  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String>? tags;
  final int? reactionsCount;
  final PostComment? firstComment;
}
