import 'package:json_annotation/json_annotation.dart';

part 'brand_dto.g.dart';

@JsonSerializable()
class BrandDto {
  @JsonKey(name: "_id")
  final String? id;

  final String? name;

  final String? slug;

  final String? image;

  BrandDto({this.id, this.name, this.slug, this.image});

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);
}
