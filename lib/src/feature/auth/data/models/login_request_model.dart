import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/login_entity.dart';

part 'login_request_model.mapper.dart';

@MappableClass()
class LoginRequestModel extends LoginRequestEntity with LoginRequestModelMappable {
  const LoginRequestModel({
    required super.username,
    required super.password,
    super.expiresIn,
  });

  factory LoginRequestModel.fromEntity(LoginRequestEntity entity) {
    return LoginRequestModel(
      username: entity.username,
      password: entity.password,
      expiresIn: entity.expiresIn,
    );
  }

}
