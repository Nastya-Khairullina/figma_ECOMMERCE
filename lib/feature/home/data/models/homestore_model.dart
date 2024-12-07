import '../../domain/entities/homestore_entity.dart';


class HomeStoreModel extends HomeStoreEntity{
   const HomeStoreModel({
    required int? id,
    required bool? isFavorites,
    required bool? isNew,
    required String? title,
    required String? subtitle,
    required String? priceWithoutDiscount,
    required String? discountPrice,
    required String? picture,
    required bool? isBuy,
    required bool? isBestSeller,
  }) : super(
      id: id,
      isFavorites:isFavorites,
      isNew: isNew,
      title: title,
      subtitle: subtitle,
      priceWithoutDiscount:priceWithoutDiscount,
      discountPrice:discountPrice,
      picture: picture,
      isBuy: isBuy,
      isBestSeller:isBestSeller
  );
   factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
     return HomeStoreModel(
       id: json['id'] as int?,
       isFavorites: json['isFavorites'] as bool?,
       isNew: json['isNew'] as bool?,
       title: json['title'] as String?,
       subtitle: json['subtitle'] as String?,
       priceWithoutDiscount: json['priceWithoutDiscount'] as String?,
       discountPrice: json['discountPrice'] as String?,
       picture:json['picture'] as String?,
       isBuy: json['isBuy'] as bool?,
       isBestSeller: json['isBestSeller'] as bool?,
     );
   }
  Map<String, dynamic> toJson() {
     return{
    'id': id,
    'isFavorites': isFavorites,
    'isNew': isNew,
    'title': title,
    'subtitle': subtitle,
    'priceWithoutDiscount': priceWithoutDiscount,
    'discountPrice': discountPrice,
    'picture': picture,
    'isBuy': isBuy,
    'isBestSeller': isBestSeller,
  };

  }

}