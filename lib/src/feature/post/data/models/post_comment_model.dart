import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/post_comment.dart';

part 'post_comment_model.mapper.dart';

@MappableClass()
class PostCommentModel with PostCommentModelMappable {
  const PostCommentModel({
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

  factory PostCommentModel.fromMap(Map<String, dynamic> json) =>
      PostCommentModelMapper.fromMap(json);

  PostComment toEntity() {
    return PostComment(
      id: id,
      body: body,
      postId: postId,
      userId: userId,
      username: username,
    );
  }
}
