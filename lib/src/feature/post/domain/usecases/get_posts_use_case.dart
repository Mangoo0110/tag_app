import 'package:async_handler/async_handler.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

final class GetPostsUseCase {
  const GetPostsUseCase(this._repository);

  final PostRepository _repository;

  AsyncRequest<List<Post>> call({int page = 1, int limit = 20}) =>
      _repository.getPosts(page: page, limit: limit);
}
