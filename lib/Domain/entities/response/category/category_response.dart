import '../common/metadata.dart';
import 'category_data.dart';

class CategoryResponse {
  final int? results;

  final Metadata? metadata;

  final List<CategoryData>? data;

  CategoryResponse({this.results, this.metadata, this.data});
}
