import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;

  @JsonKey(name: 'nextPage')
  final int? nextPage;

  MetadataDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory MetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MetadataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataDtoToJson(this);
}
