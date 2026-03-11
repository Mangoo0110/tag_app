import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/post_comment.dart';
import 'post_comment_model.dart';

part 'post_model.mapper.dart';

@MappableClass()
class PostModel with PostModelMappable {
  const PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    this.tags,
    this.reactions,
  });

  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String>? tags;
  final dynamic reactions;

  factory PostModel.fromMap(Map<String, dynamic> json) =>
      PostModelMapper.fromMap(json);

  Post toEntity({PostComment? firstComment}) {
    return Post(
      id: id,
      title: title,
      body: body,
      userId: userId,
      tags: tags,
      reactionsCount: _extractReactionsCount(reactions),
      firstComment: firstComment,
    );
  }
}

int? _extractReactionsCount(dynamic reactions) {
  if (reactions is int) return reactions;
  if (reactions is Map) {
    final likes = reactions['likes'];
    final dislikes = reactions['dislikes'];
    final likeCount = likes is num ? likes.toInt() : 0;
    final dislikeCount = dislikes is num ? dislikes.toInt() : 0;
    return likeCount + dislikeCount;
  }
  return null;
}
