import 'package:app_pigeon/app_pigeon.dart';
import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:tag_app/src/core/utils/extensions/app_pigeon_response_handler.dart';
import '../models/post_comment_model.dart';
import '../models/post_list_response_model.dart';
import '../models/post_model.dart';

final class PostRemoteDataSource with ErrorHandler {
  PostRemoteDataSource(this._appPigeon);

  final AppPigeon _appPigeon;

  Future<PostListResponseModel> getPosts({int page = 1, int limit = 20}) async {
    final skip = (page - 1) * limit;
    final response = await _appPigeon.get(
      ApiEndpoints.posts,
      queryParameters: <String, dynamic>{'limit': limit, 'skip': skip},
    );
    final body = response.data;
    if (body is Map<String, dynamic>) {
      return PostListResponseModel.fromMap(body);
    }
    final wrapped = extractBodyData(response);
    if (wrapped is Map<String, dynamic>) {
      return PostListResponseModel.fromMap(wrapped);
    }
    throw ServerException();
  }

  Future<List<PostCommentModel>> getCommentsForPost(int postId) async {
    final response = await _appPigeon.get(
      ApiEndpoints.postComments(postId),
    );
    final body = response.data;
    if (body is Map<String, dynamic> && body['comments'] is List) {
      return (body['comments'] as List)
          .whereType<Map>()
          .map((e) => _mapComment(e.cast<String, dynamic>()))
          .toList();
    }
    final wrapped = extractBodyData(response);
    if (wrapped is Map<String, dynamic> && wrapped['comments'] is List) {
      return (wrapped['comments'] as List)
          .whereType<Map>()
          .map((e) => _mapComment(e.cast<String, dynamic>()))
          .toList();
    }
    return const <PostCommentModel>[];
  }

  PostCommentModel _mapComment(Map<String, dynamic> json) {
    final user = json['user'];
    final username =
        user is Map ? user['username']?.toString() : null;
    final userId = user is Map ? user['id'] : json['userId'];
    return PostCommentModel.fromMap(
      <String, dynamic>{
        ...json,
        'username': username,
        'userId': (userId is num) ? userId.toInt() : (userId is String ? int.tryParse(userId) : null),
      },
    );
  }
}
