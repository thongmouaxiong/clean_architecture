import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResult<T> extends Equatable {
  final T data;
  final String? msg;

  const ApiResult({
    required this.data,
    this.msg,
  });

  factory ApiResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return _$ApiResultFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ApiResultToJson(this, toJsonT);
  }

  @override
  List<Object?> get props => [data, msg];
}
