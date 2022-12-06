// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      homeStore: (json['home_store'] as List<dynamic>)
          .map((e) => HomeStoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSeller: (json['best_seller'] as List<dynamic>)
          .map((e) => BestSellerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'home_store': instance.homeStore,
      'best_seller': instance.bestSeller,
    };

BestSellerModel _$BestSellerModelFromJson(Map<String, dynamic> json) =>
    BestSellerModel(
      id: json['id'] as int,
      isFavorites: json['is_favorites'] as bool,
      title: json['title'] as String,
      priceWithoutDiscount: json['price_without_discount'] as int,
      discountPrice: json['discount_price'] as int,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$BestSellerModelToJson(BestSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorites': instance.isFavorites,
      'title': instance.title,
      'price_without_discount': instance.priceWithoutDiscount,
      'discount_price': instance.discountPrice,
      'picture': instance.picture,
    };

HomeStoreModel _$HomeStoreModelFromJson(Map<String, dynamic> json) =>
    HomeStoreModel(
      id: json['id'] as int,
      isNew: json['is_new'] as bool?,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      isBuy: json['is_buy'] as bool,
    );

Map<String, dynamic> _$HomeStoreModelToJson(HomeStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_new': instance.isNew,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'picture': instance.picture,
      'is_buy': instance.isBuy,
    };
