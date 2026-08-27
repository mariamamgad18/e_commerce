import 'package:json_annotation/json_annotation.dart';

part 'count_request_dto.g.dart';

@JsonSerializable()
class CountRequestDto {
  final int count;

  CountRequestDto({required this.count});

  factory CountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CountRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountRequestDtoToJson(this);
}
