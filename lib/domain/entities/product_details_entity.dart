import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProductDetailsEntity with EquatableMixin {
  final String id;
  final List<String> images;
  final String title;
  final bool isFavorites;
  final double rating;
  final String price;
  final List<int> color;
  final String cpu;
  final String camera;
  final List<String> capacity;
  final String sd;
  final String ssd;

  const ProductDetailsEntity({
    required this.id,
    required this.images,
    required this.title,
    required this.isFavorites,
    required this.rating,
    required this.price,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.cpu,
    required this.sd,
    required this.ssd,
  });

  @override
  List<Object?> get props => [id, images, title, isFavorites, rating, price, color, cpu, camera, capacity, sd, ssd];
}
