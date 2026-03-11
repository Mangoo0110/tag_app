import 'package:app_pigeon/app_pigeon.dart';
import 'package:get_it/get_it.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'data/datasources/post_remote_data_source.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/repositories/post_repository.dart';
import 'domain/usecases/get_posts_use_case.dart';
import 'presentation/controllers/post_controller.dart';

final postServiceLocator = GetIt.instance;

void setupPostLocator() {
  if (!postServiceLocator.isRegistered<AppPigeon>()) {
    postServiceLocator.registerLazySingleton<AppPigeon>(
      () => GhostPigeon(baseUrl: ApiEndpoints.baseUrl),
    );
  }

  if (!postServiceLocator.isRegistered<PostRemoteDataSource>()) {
    postServiceLocator.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSource(postServiceLocator<AppPigeon>()),
    );
  }

  if (!postServiceLocator.isRegistered<PostRepository>()) {
    postServiceLocator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postServiceLocator<PostRemoteDataSource>()),
    );
  }

  if (!postServiceLocator.isRegistered<GetPostsUseCase>()) {
    postServiceLocator.registerLazySingleton<GetPostsUseCase>(
      () => GetPostsUseCase(postServiceLocator<PostRepository>()),
    );
  }

  if (!postServiceLocator.isRegistered<PostController>()) {
    postServiceLocator.registerLazySingleton<PostController>(
      () => PostController(postServiceLocator<GetPostsUseCase>()),
    );
  }
}
