import 'package:json_annotation/json_annotation.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel {
  BasketModel({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  @JsonKey(name: 'basket')
  final List<Basket> basket;
  @JsonKey(name: 'delivery')
  final String delivery;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'total')
  final int total;

  factory BasketModel.fromJson(Map<String, dynamic> json) => _$BasketModelFromJson(json);
  Map<String, dynamic> toJson() => _$BasketModelToJson(this);
}

@JsonSerializable()
class Basket {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'images')
  final String images;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'title')
  final String title;

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
