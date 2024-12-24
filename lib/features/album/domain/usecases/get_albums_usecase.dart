import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/album/domain/entities/album.dart';
import 'package:clean_architecture/features/album/domain/repositories/album_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAlbumsUsecase extends UsecaseNoParam<List<Album>> {
  final AlbumRepository _albumRepository;

  GetAlbumsUsecase(this._albumRepository);

  @override
  Future<Either<AppError, List<Album>>> call() async {
    return await _albumRepository.getAlbums();
  }
}
