class PostComment {
  const PostComment({
    required this.id,
    required this.body,
    required this.postId,
    required this.userId,
    this.username,
  });

  final int id;
  final String body;
  final int postId;
  final int userId;
  final String? username;
}
