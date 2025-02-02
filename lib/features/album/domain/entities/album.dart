import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final int? userId;
  final int? id;
  final String? title;

  const Album({this.userId, this.id, this.title});

  @override
  List<Object?> get props => [userId, id, title];
}
