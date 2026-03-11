import 'package:flutter/foundation.dart';
import 'package:pagination_pkg/pagination_pkg.dart';
import 'package:tag_app/src/app/helpers/pagination_response_converter.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts_use_case.dart';

final class PostController extends ChangeNotifier {
  PostController(this._getPosts);

  final GetPostsUseCase _getPosts;

  late final InfinityScrollPaginationController<String, Post> pagination =
      InfinityScrollPaginationController<String, Post>(
        maxCapacityCount: 500,
        onDemandPageCall: ({required onDemandPage}) async {
          final res = await _getPosts(
            page: onDemandPage.pageNo,
            limit: onDemandPage.limit,
          );
          return res.toPostPaginationResponse(onDemandPage: onDemandPage);
        },
      );

  void refresh() => pagination.refresh();

  @override
  void dispose() {
    pagination.dispose();
    super.dispose();
  }
}
