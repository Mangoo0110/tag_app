import 'package:async_handler/async_handler.dart';
import '../entities/post.dart';

abstract interface class PostRepository {
  AsyncRequest<List<Post>> getPosts({int page = 1, int limit = 20});
}
