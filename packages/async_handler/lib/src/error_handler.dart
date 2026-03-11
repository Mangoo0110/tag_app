import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'debug/debug_service.dart';
import 'api_response.dart';
import 'exceptions.dart';

typedef ExceptionMapper = ErrorResponse<T>? Function<T>(
  Object error,
  StackTrace stackTrace,
);

final class ErrorHandlerConfig {
  ErrorHandlerConfig._();

  static final List<ExceptionMapper> mappers = <ExceptionMapper>[
    _dioExceptionMapper,
    _timeoutExceptionMapper,
    _formatExceptionMapper,
  ];

  static void registerMapper(ExceptionMapper mapper) {
    mappers.insert(0, mapper);
  }
}

mixin class ErrorHandler {
  Future<ApiResponse<T>> asyncTryCatch<T>({
    required Future<ApiResponse<T>> Function() tryFunc,
  }) async {
    final ErrorResponse<T> error;
    try {
      return await tryFunc();
    } on ServerException catch (e, s) {
      error = ErrorResponse(
        message: "Server error!",
        exception: e,
        stackTrace: s
      );
    } on NoDataException catch (e, s) {
      error = ErrorResponse(
        message: "No data!",
        exception: e,
        stackTrace: s
      );
    } on SocketException catch(e, s) {
      error =
        ErrorResponse(
          exception: e,
          message: 'Internet connection failed!',
          stackTrace: s
      );
    } catch (e, s) {
      ErrorResponse<T>? mapped;
      for (final mapper in ErrorHandlerConfig.mappers) {
        mapped = mapper<T>(e, s);
        if (mapped != null) break;
      }
      error = mapped ??
          ErrorResponse(
            message: 'Some error occured.',
            exception: e is Exception ? e : Exception(e.toString()),
            stackTrace: s,
          );
    }

    debugPrint(error.toString());
    log("async error: ", stackTrace: error.stackTrace);
    return error;
  }

  // ApiResponse<T> tryCatch<T>({required T Function() tryFunc}) {
  //   try {
  //     return Right(tryFunc());
  //   } on ServerException {
  //     return Left(
  //       DataCRUDFailure(failure: Failure.severFailure, fullError: ''),
  //     );
  //   } on SocketException {
  //     return Left(
  //       DataCRUDFailure(
  //         failure: Failure.socketFailure,
  //         fullError: 'Internet connection failed!',
  //       ),
  //     );
  //   } catch (e) {
  //     return Left(
  //       DataCRUDFailure(
  //         failure: Failure.unknownFailure,
  //         fullError: 'Some error occured. Error: ${e.toString()}',
  //       ),
  //     );
  //   }
  // }

}

ErrorResponse<T>? _timeoutExceptionMapper<T>(
  Object error,
  StackTrace stackTrace,
) {
  if (error is TimeoutException) {
    return ErrorResponse(
      message: 'Connection timeout! Please try again.',
      exception: error,
      stackTrace: stackTrace,
    );
  }
  return null;
}

ErrorResponse<T>? _formatExceptionMapper<T>(
  Object error,
  StackTrace stackTrace,
) {
  if (error is FormatException) {
    return ErrorResponse(
      message: 'Invalid response format.',
      exception: error,
      stackTrace: stackTrace,
    );
  }
  return null;
}

ErrorResponse<T>? _dioExceptionMapper<T>(
  Object error,
  StackTrace stackTrace,
) {
  if (error.runtimeType.toString() != 'DioException') return null;

  try {
    final dynamic e = error;
    final dynamic innerError = e.error;
    if (innerError is SocketException) {
      return ErrorResponse(
        message: 'Internet connection failed!',
        exception: error is Exception ? error : Exception(error.toString()),
        stackTrace: stackTrace,
      );
    }
    final dynamic response = e.response;
    final dynamic data = response?.data;
    final messageFromBody = data is Map ? data['message']?.toString() : null;
    final typeName = e.type?.toString() ?? '';

    String message;
    if (typeName.contains('connectionTimeout') ||
        typeName.contains('receiveTimeout') ||
        typeName.contains('sendTimeout')) {
      message = 'Connection timeout! Please try again.';
    } else if (typeName.contains('cancel')) {
      message = 'Request cancelled!';
    } else {
      message = messageFromBody ?? 'Network request failed.';
    }

    return ErrorResponse(
      message: message,
      exception: error is Exception ? error : Exception(error.toString()),
      stackTrace: stackTrace,
    );
  } catch (_) {
    return ErrorResponse(
      message: 'Network request failed.',
      exception: error is Exception ? error : Exception(error.toString()),
      stackTrace: stackTrace,
    );
  }
}
