import '../common/metadata.dart';
import 'brand_data.dart';

class BrandsResponse {
  final int? results;
  final Metadata? metadata;

  final List<BrandData>? data;

  BrandsResponse({this.results, this.metadata, this.data});
}
