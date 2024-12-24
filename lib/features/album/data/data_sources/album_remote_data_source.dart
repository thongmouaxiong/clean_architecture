import 'package:clean_architecture/core/services/api_service.dart';
import 'package:clean_architecture/features/album/data/models/album_model.dart';
import 'package:clean_architecture/features/album/data/models/photo_model.dart';
import 'package:injectable/injectable.dart';

abstract class AlbumRemoteDataSource {
  Future<List<AlbumModel>> getAlbums();

  Future<List<PhotoModel>> getAllPhotos();

  Future<List<PhotoModel>> getPhotosByAlbumId({required int albumId});
}

@Injectable(as: AlbumRemoteDataSource)
class AlbumRemoteDataSourceImpl extends AlbumRemoteDataSource {
  final ApiService _api;

  AlbumRemoteDataSourceImpl(this._api);

  @override
  Future<List<AlbumModel>> getAlbums() async {
    return await _api.getAlbums();
  }

  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    return await _api.getAllPhotos();
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId({required int albumId}) async {
    return await _api.getPhotosByAlbumId(albumId: albumId);
  }
}
