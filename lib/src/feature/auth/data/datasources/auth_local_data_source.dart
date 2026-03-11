import 'package:app_pigeon/app_pigeon.dart';
import 'package:tag_app/src/feature/auth/data/models/login_response_model.dart';

final class AuthLocalDataSource {
  AuthLocalDataSource(this._authorizedPigeon);

  final AuthorizedPigeon _authorizedPigeon;

  Future<Auth?> getCurrentAuthRecord() => _authorizedPigeon.getCurrentAuthRecord();

  Future<void> saveNewAuth(LoginResponseModel params) async{
    return await _authorizedPigeon.saveNewAuth(saveAuthParams: SaveNewAuthParams(
      accessToken: params.accessToken, refreshToken: params.refreshToken, data: params.authenticatedUser?.toMap(),));
  }

  Future<void> logOut() => _authorizedPigeon.logOut();

  Stream<bool> get isLoggedIn => _authorizedPigeon.authStream.map(
    (event) {
      if(event is Authenticated) {
        return true;
      }
      return false;
    });
}
