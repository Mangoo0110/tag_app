import 'package:async_handler/async_handler.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';

final class PostRepositoryImpl with ErrorHandler implements PostRepository{
  PostRepositoryImpl(this._remote);

  final PostRemoteDataSource _remote;

  @override
  AsyncRequest<List<Post>> getPosts({int page = 1, int limit = 20}) =>
      asyncTryCatch<List<Post>>(
        tryFunc: () async {
          final response = await _remote.getPosts(page: page, limit: limit);
          final posts = response.items;
          final enriched = await Future.wait(
            posts.map((post) async {
              final comments = await _remote.getCommentsForPost(post.id);
              final firstComment =
                  comments.isNotEmpty ? comments.first.toEntity() : null;
              return post.toEntity(firstComment: firstComment);
            }),
          );
          return SuccessResponse<List<Post>>(data: enriched);
        },
      );
}
