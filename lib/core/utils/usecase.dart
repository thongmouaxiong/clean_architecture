import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:dart_either/dart_either.dart';

abstract class Usecase<T, P> {
  Future<Either<AppError, T>> call(P param);
}

abstract class UsecaseNoParam<T> {
  Future<Either<AppError, T>> call();
}

abstract class UsecaseNoT {
  Future<Either<AppError, Null>> call();
}

abstract class UsecaseNormal<T, P> {
  Either<AppError, T> call(P param);
}
