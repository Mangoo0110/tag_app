import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/auth_user.dart';

part 'auth_user_model.mapper.dart';

@MappableClass()
class AuthUserModel extends AuthUser with AuthUserModelMappable {
  const AuthUserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.phone,
  });

  factory AuthUserModel.fromEntity(AuthUser entity) {
    return AuthUserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
    );
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> json) {
    final name = (json['name'] as Map?)?.cast<String, dynamic>() ?? const {};
    return AuthUserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: (json['email'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
      firstName:
          (name['firstname'] as String?) ??
          (json['firstName'] as String?) ??
          '',
      lastName:
          (name['lastname'] as String?) ??
          (json['lastName'] as String?) ??
          '',
      phone: (json['phone'] as String?) ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'name': <String, dynamic>{'firstname': firstName, 'lastname': lastName},
    };
  }
}
