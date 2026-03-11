import 'post_model.dart';

class PostListResponseModel {
  const PostListResponseModel({
    required this.items,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<PostModel> items;
  final int total;
  final int skip;
  final int limit;

  factory PostListResponseModel.fromMap(Map<String, dynamic> json) {
    final posts = json['posts'];
    final items =
        (posts is List ? posts : const <dynamic>[])
            .whereType<Map>()
            .map((e) => PostModel.fromMap(e.cast<String, dynamic>()))
            .toList();
    return PostListResponseModel(
      items: items,
      total: (json['total'] as num?)?.toInt() ?? items.length,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? items.length,
    );
  }
}
