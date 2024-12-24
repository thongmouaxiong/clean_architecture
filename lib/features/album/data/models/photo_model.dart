import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable(createToJson: false)
class PhotoModel extends Photo {
  const PhotoModel({
    super.albumId,
    super.id,
    super.title,
    super.url,
    super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
