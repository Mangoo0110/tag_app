import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPostsParams {
  const GetPostsParams({this.page = 1, this.limit = 20});

  final int page;
  final int limit;
}

final class GetPostsUseCase
    implements AsyncUsecase<List<Post>, GetPostsParams> {
  const GetPostsUseCase(this._repository);

  final PostRepository _repository;

  @override
  AsyncRequest<List<Post>> call(GetPostsParams params) =>
      _repository.getPosts(page: params.page, limit: params.limit);
}
