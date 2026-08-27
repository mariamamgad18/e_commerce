import 'package:json_annotation/json_annotation.dart';

part 'category_data_dto.g.dart';

@JsonSerializable()
class CategoryDataDto {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  CategoryDataDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDataDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataDtoToJson(this);
}
