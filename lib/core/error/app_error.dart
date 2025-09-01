import 'package:equatable/equatable.dart';

//Class used to handle app errors
class AppError extends Equatable {
  final AppErrorType type;
  final int? code;
  final String message;

  const AppError({
    required this.type,
    this.code,
    this.message = "Something went wrong. Please try again.",
  });

  factory AppError.device(String message) {
    return AppError(type: AppErrorType.device, message: message);
  }

  factory AppError.unknown(String message) {
    return AppError(type: AppErrorType.unknown, message: message);
  }

  @override
  List<Object?> get props => [type, code, message];
}

enum AppErrorType {
  api,
  network,
  database,
  device,
  unauthorised,
  timeout,
  unknown,
  cancelled,
}
