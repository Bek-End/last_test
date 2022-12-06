import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  ProductDetailsModel({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });
  @JsonKey(name: 'CPU')
  final String cpu;
  @JsonKey(name: 'camera')
  final String camera;
  @JsonKey(name: 'capacity')
  final List<String> capacity;
  @JsonKey(name: 'color')
  final List<String> color;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'images')
  final List<String> images;
  @JsonKey(name: 'isFavorites')
  final bool isFavorites;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'rating')
  final double rating;
  @JsonKey(name: 'sd')
  final String sd;
  @JsonKey(name: 'ssd')
  final String ssd;
  @JsonKey(name: 'title')
  final String title;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => _$ProductDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
