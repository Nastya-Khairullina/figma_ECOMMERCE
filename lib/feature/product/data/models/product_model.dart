import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product_entity.dart';
part 'product_modelG.dart';

@JsonSerializable( )
class ProductModel extends ProductEntity{
  @override
  @JsonKey(name: 'CPU')
  final String? cpu;

  const ProductModel({
    this.cpu,
    required String? camera,
    required int? id,
    required List<dynamic> images,
    required bool? isFavorites,
    required String? price,
    required int? rating,
    required String? sd,
    required String? capacity,
    required String? color,
    required String? title,
  }
      ) : super(
    cpu: cpu,
    camera: camera,
    id: id,
    images: images,
    isFavorites: isFavorites,
    price: price,
    rating: rating,
    sd: sd,
    capacity: capacity,
    color: color,
    title: title,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}