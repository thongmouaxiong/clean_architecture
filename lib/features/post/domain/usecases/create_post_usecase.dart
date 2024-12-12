import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/post/data/models/post_model.dart';
import 'package:clean_architecture/features/post/domain/repositories/post_repository.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreatePostUsecase extends Usecase<PostModel?, PostModel> {
  final PostRepository _postRepository;

  CreatePostUsecase(this._postRepository);

  @override
  Future<Either<AppError, PostModel?>> call(PostModel param) async {
    return await _postRepository.createPost(post: param);
  }
}
