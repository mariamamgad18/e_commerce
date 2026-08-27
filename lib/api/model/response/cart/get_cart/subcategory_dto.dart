import 'package:json_annotation/json_annotation.dart';

part 'subcategory_dto.g.dart';

@JsonSerializable()
class SubcategoryDto {
  @JsonKey(name: "_id")
  final String? id;

  final String? name;

  final String? slug;

  final String? category;

  SubcategoryDto({this.id, this.name, this.slug, this.category});

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryDtoToJson(this);
}
