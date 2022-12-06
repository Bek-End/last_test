import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  ProductsModel({
    required this.homeStore,
    required this.bestSeller,
  });

  @JsonKey(name: 'home_store')
  final List<HomeStoreModel> homeStore;
  @JsonKey(name: 'best_seller')
  final List<BestSellerModel> bestSeller;
  
  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class BestSellerModel {
  BestSellerModel({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'is_favorites')
  final bool isFavorites;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  @JsonKey(name: 'picture')
  final String picture;
  
  factory BestSellerModel.fromJson(Map<String, dynamic> json) => _$BestSellerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}

@JsonSerializable()
class HomeStoreModel {
  HomeStoreModel({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'is_new')
  final bool? isNew;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'subtitle')
  final String subtitle;
  @JsonKey(name: 'picture')
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) => _$HomeStoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);
}
