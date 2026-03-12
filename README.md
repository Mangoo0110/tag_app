# tag_app

Clean-architecture Flutter app using DummyJSON as the backend.

## Setup (brief)

1. Install Flutter (stable) and ensure `flutter doctor` is clean.
2. Fetch dependencies:
   - `flutter pub get`
3. Generate mappers (dart_mappable):
   - `flutter pub run build_runner build --delete-conflicting-outputs`
4. Run the app:
   - `flutter run`

## Features

- Auth, Category, Product, Post (clean architecture: `domain/`, `data/`, `presentation/`)
- Pagination for product/post lists
- Remote-only data for posts, DummyJSON for other resources

## Key packages used

- `app_pigeon`: HTTP client wrapper
- `dart_mappable`: model mapping (`*.mapper.dart`)
- `pagination_pkg`: pagination engine
- `async_handler`: async error handling & response wrapper
- `get_it`: dependency injection
- `hive_ce`: local storage (if/when used)
- `flutter_animate`: subtle UI animations

## API base

- DummyJSON: `https://dummyjson.com`
