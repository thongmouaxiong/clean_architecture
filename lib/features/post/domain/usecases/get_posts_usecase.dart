import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
import 'package:clean_architecture/features/post/domain/repositories/post_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetPostsUsecase extends UsecaseNoParam<List<Post>> {
  final PostRepository _postRepository;

  GetPostsUsecase(this._postRepository);

  @override
  Future<Either<AppError, List<Post>>> call() async {
    return await _postRepository.getPosts();
  }
}
