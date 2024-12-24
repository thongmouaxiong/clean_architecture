import 'package:clean_architecture/core/constants/error_message.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/extension/dio_errror_extension.dart';
import 'package:clean_architecture/features/album/data/data_sources/album_remote_data_source.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:clean_architecture/features/album/domain/repositories/album_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AlbumRepository)
class AlbumRepositoryImpl extends AlbumRepository {
  final AlbumRemoteDataSource _albumRemote;

  AlbumRepositoryImpl(this._albumRemote);

  @override
  Future<Either<AppError, List<Album>>> getAlbums() async {
    try {
      final albums = await _albumRemote.getAlbums();
      return Right(albums);
    } on DioException catch (err) {
      return Left(err.getError(defaultMsg: ErrorMessage.loadAlbumFail));
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.loadAlbumFail));
    }
  }

  @override
  Future<Either<AppError, List<Photo>>> getAllPhotos() async {
    try {
      final photos = await _albumRemote.getAllPhotos();
      return Right(photos);
    } on DioException catch (err) {
      return Left(err.getError(defaultMsg: ErrorMessage.loadPhotoFail));
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.loadPhotoFail));
    }
  }

  @override
  Future<Either<AppError, List<Photo>>> getPhotosByAlbumId({
    required int albumId,
  }) async {
    try {
      final photos = await _albumRemote.getPhotosByAlbumId(albumId: albumId);
      return Right(photos);
    } on DioException catch (err) {
      return Left(err.getError(defaultMsg: ErrorMessage.loadPhotoFail));
    } catch (err) {
      return const Left(AppError(msg: ErrorMessage.loadPhotoFail));
    }
  }
}
