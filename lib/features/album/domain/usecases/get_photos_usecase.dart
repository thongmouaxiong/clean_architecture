import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/album/domain/entities/photo.dart';
import 'package:clean_architecture/features/album/domain/repositories/album_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetPhotosUsecase extends Usecase<List<Photo>, int> {
  final AlbumRepository _albumRepository;

  GetPhotosUsecase(this._albumRepository);

  @override
  Future<Either<AppError, List<Photo>>> call(int param) async {
    return await _albumRepository.getPhotosByAlbumId(albumId: param);
  }
}
