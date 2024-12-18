import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:clean_architecture/core/utils/usecase.dart';
import 'package:clean_architecture/features/post/domain/entities/comment.dart';
import 'package:clean_architecture/features/post/domain/repositories/post_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCommentsUsecase extends Usecase<List<Comment>, int> {
  final PostRepository _postRepository;

  GetCommentsUsecase(this._postRepository);

  @override
  Future<Either<AppError, List<Comment>>> call(int param) async {
    return await _postRepository.getCommentsByPostId(postId: param);
  }
}
