import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:clean_architecture/features/album/domain/usecases/get_albums_usecase.dart';
import 'package:clean_architecture/features/album/domain/usecases/get_all_photos_usecase.dart';
import 'package:clean_architecture/features/album/domain/usecases/get_photos_usecase.dart';
import 'package:clean_architecture/features/album/presentation/cubit/album_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AlbumCubit extends Cubit<AlbumState> {
  final GetAlbumsUsecase _getAlbumsUsecase;
  final GetPhotosUsecase _getPhotosUsecase;
  final GetAllPhotosUsecase _getAllPhotosUsecase;

  AlbumCubit(
    this._getAlbumsUsecase,
    this._getPhotosUsecase,
    this._getAllPhotosUsecase,
  ) : super(const AlbumState());

  Future<void> init() async {
    emit(state.copyWith(status: StateStatus.loading));
    final resAlbum = await _getAlbumsUsecase();
    if (resAlbum.isRight) {
      await loadAllPhotos();
      emit(state.copyWith(
        status: StateStatus.done,
        albums: resAlbum.right,
      ));
      return;
    }

    emit(state.copyWith(
      status: StateStatus.error,
      error: resAlbum.left,
    ));
  }

  Future<void> loadPhotos({Album? album}) async {
    if (album?.id != null) {
      emit(state.copyWith(status: StateStatus.loading));
      final resAlbum = await _getPhotosUsecase(album!.id!);
      if (resAlbum.isRight) {
        emit(state.copyWith(
          status: StateStatus.done,
          photos: resAlbum.right,
        ));
        return;
      }

      emit(state.copyWith(
        status: StateStatus.error,
        error: resAlbum.left,
      ));
    }
  }

  Future<void> loadAllPhotos() async {
    final resPhotos = await _getAllPhotosUsecase();
    if (resPhotos.isRight) {
      Map<int?, List<Photo>> groupPhoto =
          groupBy(resPhotos.right, (photo) => photo.albumId);
      emit(state.copyWith(groupPhoto: groupPhoto));
    }
  }
}
