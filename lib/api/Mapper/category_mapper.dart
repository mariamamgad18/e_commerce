import 'package:ecommerce/Domain/entities/response/category/category_data.dart';
import 'package:ecommerce/api/model/response/Category/category_data_dto.dart';

extension CategoryMapper on CategoryDataDto {
  CategoryData ToCategoryDataDto() {
    return CategoryData(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
