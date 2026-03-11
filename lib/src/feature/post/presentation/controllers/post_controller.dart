import 'package:flutter/foundation.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/process_notifier.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/snackbar_notifier.dart';
import 'package:tag_app/src/core/utils/helpers/handle_future_request.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts_use_case.dart';

final class PostController extends ChangeNotifier {
  PostController(this._getPosts);

  final GetPostsUseCase _getPosts;

  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier(
    initialStatus: ProcessLoading(message: 'Loading'),
  );

  List<Post> _posts = const <Post>[];

  List<Post> get posts => _posts;

  Future<void> load({
    SnackbarNotifier? errorSnackbarNotifier,
  }) async {
    final result = await handleFutureRequest<List<Post>>(
      futureRequest: () => _getPosts(page: 1, limit: 20),
      processStatusNotifier: processNotifier,
      errorSnackbarNotifier: errorSnackbarNotifier,
      onSuccess: (data) => _posts = data,
    );
    if (result == null) {
      processNotifier.setError(message: 'Failed');
    }
    notifyListeners();
  }
}
