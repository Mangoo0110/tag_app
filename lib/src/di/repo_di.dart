import 'package:get_it/get_it.dart';
import 'package:app_pigeon/app_pigeon.dart';
import 'package:tag_app/src/di/auth_di.dart';
import 'package:tag_app/src/feature/category/data/repositories/category_repository_impl.dart';
import 'package:tag_app/src/feature/category/data/repositories/mock_category_repository.dart';
import 'package:tag_app/src/feature/category/domain/repositories/category_repository.dart';
import 'package:tag_app/src/feature/category/domain/usecases/get_categories_use_case.dart';
import 'package:tag_app/src/feature/category/domain/usecases/get_category_by_id_use_case.dart';
import 'package:tag_app/src/feature/category/domain/usecases/search_categories_use_case.dart';
import 'package:tag_app/src/feature/category/presentation/controllers/category_controller.dart';
import 'package:tag_app/src/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:tag_app/src/feature/product/data/repositories/mock_product_repository.dart';
import 'package:tag_app/src/feature/product/data/repositories/product_repository_impl.dart';
import 'package:tag_app/src/feature/product/domain/repositories/product_repository.dart';
import 'package:tag_app/src/feature/product/domain/usecases/get_product_by_id_use_case.dart';
import 'package:tag_app/src/feature/product/domain/usecases/get_products_use_case.dart';
import 'package:tag_app/src/feature/product/domain/usecases/get_variants_by_product_id_use_case.dart';

import '../core/constants/api_endpoints.dart';
import '../feature/post/post.dart';

final serviceLocator = GetIt.instance;

void initDependency() async {
  
  serviceLocator.registerLazySingleton<AppPigeon>(
    () => GhostPigeon(baseUrl: ApiEndpoints.baseUrl),
  );

  setupAuthLocator();
  
  setupPostLocator();

  serviceLocator.registerLazySingleton<CategoryRepository>(
    () =>
        CategoryRepositoryImpl(appPigeon: serviceLocator<AppPigeon>()),
    //MockCategoryRepository(),
  );
  serviceLocator.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(serviceLocator<CategoryRepository>()),
  );
  serviceLocator.registerLazySingleton<GetCategoryByIdUseCase>(
    () => GetCategoryByIdUseCase(serviceLocator<CategoryRepository>()),
  );
  serviceLocator.registerLazySingleton<SearchCategoriesUseCase>(
    () => SearchCategoriesUseCase(serviceLocator<CategoryRepository>()),
  );
  serviceLocator.registerLazySingleton<CategoryController>(
    () => CategoryController(serviceLocator<GetCategoriesUseCase>()),
  );


  serviceLocator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(serviceLocator<AppPigeon>()),
  );

  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      fallbackRepo: MockProductRepository(),
      remote: serviceLocator<ProductRemoteDataSource>(),
    ),
  );
  serviceLocator.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(serviceLocator<ProductRepository>()),
  );
  serviceLocator.registerLazySingleton<GetProductByIdUseCase>(
    () => GetProductByIdUseCase(serviceLocator<ProductRepository>()),
  );
  serviceLocator.registerLazySingleton<GetVariantsByProductIdUseCase>(
    () => GetVariantsByProductIdUseCase(serviceLocator<ProductRepository>()),
  );

  setupPostLocator();

  // serviceLocator.registerFactory<AuthRepo>(
  //     () => AuthRepoImpl());
  // serviceLocator.registerLazySingleton<ClassPhotoRepo>(
  //     () => ClassPhotoRepoImpl(
  //       authRepo: serviceLocator<AuthRepo>(),
  //     ));
  // serviceLocator.registerLazySingleton<ProfileRepo>(
  //     () => ProfileRepoImpl(),
  // );
  // serviceLocator.registerLazySingleton<OnboardingRepo>(
  //     () => OnboardingRepoImpl(),
  // );
  // serviceLocator.registerSingleton<ImageRepo>(
  //     FirebaseImageRepo(),
  // );
  // serviceLocator.registerLazySingleton(
  //     () => ImageInMemoryCacheService(serviceLocator<ImageRepo>()));
}
