part of 'product_model.dart';

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  cpu: json['cpu'] as String?,
  camera: json['camera'] as String?,
  id: json['id'] as int?,
  images: json['images'] as List<dynamic>,
  isFavorites: json['isFavorites'] as bool?,
  price: json['price'] as String?,
  rating: json['rating'] as int?,
  sd: json['sd'] as String?,
  capacity: json['capacity'] as String?,
  color: json['color'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'cpu': instance.cpu,
      'camera': instance.camera,
      'id': instance.id,
      'images': instance.images,
      'isFavorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'title': instance.title,
      'capacity': instance.capacity,
      'color': instance.color,

    };
