import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:either_dart/either.dart';

abstract class AlbumRepository {
  Future<Either<AppError, List<Album>>> getAlbums();

  Future<Either<AppError, List<Photo>>> getAllPhotos();

  Future<Either<AppError, List<Photo>>> getPhotosByAlbumId({
    required int albumId,
  });
}
