import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable(createToJson: false)
class AlbumModel extends Album {
  const AlbumModel({
    super.userId,
    super.id,
    super.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
