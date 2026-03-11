import 'package:app_pigeon/app_pigeon.dart';
import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:tag_app/src/feature/auth/data/models/login_request_model.dart';
import 'package:tag_app/src/feature/auth/data/models/login_response_model.dart';
import 'package:tag_app/src/feature/auth/domain/entities/login_entity.dart';

final class AuthRemoteDataSource {
  AuthRemoteDataSource(this._authorizedPigeon);

  final AuthorizedPigeon _authorizedPigeon;

  Future<Response<dynamic>> get(String path) => _authorizedPigeon.get(path);

  Future<LoginResponseModel> login(LoginRequestEntity request) async {
    final payload = LoginRequestModel.fromEntity(request).toMap();
    final loginResponse = await _authorizedPigeon.post(
      ApiEndpoints.login,
      data: payload,
    );

    final data = loginResponse.data;
    if (data is! Map<String, dynamic>) {
      throw ServerException();
    }
    final response = LoginResponseModel.fromMap(data);
    if (response.accessToken == null || response.accessToken!.isEmpty) {
      throw ServerException();
    }
    return response;
  }
}
