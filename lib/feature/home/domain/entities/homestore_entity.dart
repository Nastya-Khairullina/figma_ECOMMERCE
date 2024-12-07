import 'package:equatable/equatable.dart';

class HomeStoreEntity extends Equatable{
  final int? id;
  final bool? isFavorites;
  final bool? isNew;
  final String? title;
  final String? subtitle;
  final String? priceWithoutDiscount;
  final String? discountPrice;
  final String? picture;
  final bool? isBuy;
  final bool? isBestSeller;

  const HomeStoreEntity({
    required this.id,
    required this.isFavorites,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
    required this.isBuy,
  required this.isBestSeller,
  });

  @override
  List<Object?> get props => [
    id,
    isFavorites,
    isNew,
    title,
    subtitle,
    priceWithoutDiscount,
    discountPrice,
    picture,
    isBuy,
    isBestSeller];
}