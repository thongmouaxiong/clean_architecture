import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String? title;
  final String? msg;

  const AppError({this.title, this.msg});

  @override
  List<Object?> get props => [title, msg];
}
