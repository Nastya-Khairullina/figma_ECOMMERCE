
import 'package:equatable/equatable.dart';


class ProductEntity extends Equatable {
  final String? cpu;
  final String? camera;
  final int? id;
  final List<dynamic> images;
  final bool? isFavorites;
  final String? price;
  final int? rating;
  final String? sd;
  final String? capacity;
  final String? color;
  final String? title;

  const ProductEntity({
    required this.cpu,
    required this.camera,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.capacity,
    required this.color,
    required this.title,
  });

  @override
  List<Object?> get props =>
      [
        cpu,
        camera,
        id,
        images,
        isFavorites,
        price,
        rating,
        sd,
        capacity,
        color,
        title
      ];
  Map<String, dynamic> toJson() {
    return {
      'cpu': cpu,
      'camera': camera,
      'id': id,
      'images': images,
      'isFavorites': isFavorites,
      'price': price,
      'rating': rating,
      'sd': sd,
      'title': title,
      'capacity': capacity,
      'color': color,
    };
  }

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
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
  }
}
