import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'album_state.g.dart';

@CopyWith(copyWithNull: true)
class AlbumState extends Equatable {
  final StateStatus status;
  final List<Album> albums;
  final List<Photo> photos;
  final Map<int?, List<Photo>> groupPhoto;
  final AppError? error;

  const AlbumState({
    this.status = StateStatus.initail,
    this.albums = const [],
    this.photos = const [],
    this.groupPhoto = const {},
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        albums,
        photos,
        groupPhoto,
        error,
      ];
}
