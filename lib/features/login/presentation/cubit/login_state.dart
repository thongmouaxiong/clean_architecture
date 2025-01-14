import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'login_state.g.dart';

@CopyWith(copyWithNull: true)
class LoginState extends Equatable {
  final StateStatus status;
  final AppError? error;
  final bool alreadLogined;

  const LoginState({
    this.status = StateStatus.initail,
    this.error,
    this.alreadLogined = false,
  });

  @override
  List<Object?> get props => [status, error, alreadLogined];
}
