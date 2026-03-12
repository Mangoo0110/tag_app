import 'package:flutter/foundation.dart';

base class ApiEndpoints {
  static const String socketUrl = _RemoteServer.socketUrl;

  static const String baseUrl = _RemoteServer.baseUrl;

  // ---------------------- AUTH -----------------------------
  /// ### post
  static const String login = '$baseUrl/auth/login';
  static const String refresh = '$baseUrl/auth/refresh';

  // ---------------------- USER -----------------------------
  /// ### get
  static const String users = '$baseUrl/users';
  static String getUserProfile(String userId) => '$baseUrl/users/$userId';
  static const String currentUser = '$baseUrl/users/me';

  // ---------------------- PRODUCT -----------------------------
  static const String getProducts = '$baseUrl/products';
  static String singleProduct(String productId) => '$baseUrl/products/$productId';

  // ---------------------- POSTS -----------------------------
  static const String posts = '$baseUrl/posts';
  static String postComments(int postId) => '$baseUrl/posts/$postId/comments';

}

class _RemoteServer {
  static const String socketUrl = 'https://dummyjson.com';

  static const String baseUrl = 'https://dummyjson.com';
}

class _LocalHostWifi {
  static const String socketUrl = 'http://10.10.5.90:5006';

  static const String baseUrl = 'http://10.10.5.90:5006/api/v1';
}

class _Auth {
  @protected
  static const String _authRoute = '${ApiEndpoints.baseUrl}/auth';
  // example
  //static const String login = '$_authRoute/login';
}

// ---------------------- Notification -----------------------------
class _Notification {
  static const String _notificationRoute =
      '${ApiEndpoints.baseUrl}/notification';
}

class _User {
  static const String _userRoute = '${ApiEndpoints.baseUrl}/user';
}

// ---------------------- MESSAGE -----------------------------
class _Message {
  static const String _messageRoute = '${ApiEndpoints.baseUrl}/message';
}
