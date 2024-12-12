import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/repositories/post_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdatePostUsecase extends Usecase<PostModel?, PostModel> {
  final PostRepository _postRepository;

  UpdatePostUsecase(this._postRepository);

  @override
  Future<Either<AppError, PostModel?>> call(PostModel param) async {
    return await _postRepository.updatePost(post: param);
  }
}
