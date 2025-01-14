import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:either_dart/either.dart';

abstract class Usecase<T, P> {
  Future<Either<AppError, T>> call(P param);
}

abstract class UsecaseNoParam<T> {
  Future<Either<AppError, T>> call();
}

abstract class UsecaseNoType {
  Future<Either<AppError, Null>> call();
}

abstract class UsecaseNormal<T, P> {
  Either<AppError, T> call(P param);
}

abstract class UsecaseNormalNoParam<T> {
  Either<AppError, T> call();
}
