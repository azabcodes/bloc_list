import 'package:equatable/equatable.dart';

import '../src/item_source.dart';

class ProductEntity extends Equatable implements ItemClassWithAccessor {
  final String id;
  final String name;
  final bool isAvailable;
  final double price;
  final String imageUrl;
  final String priceRange;
  final String category;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.isAvailable,
    required this.price,
    required this.priceRange,
    required this.imageUrl,
    required this.category,
  });

  @override
  List<Object> get props => [
    id,
    name,
    isAvailable,
    price,
    imageUrl,
    category,
    priceRange,
  ];

  @override
  dynamic operator [](String prop) {
    switch (prop) {
      case 'name':
        return name;
      case 'price':
        return price;
      case 'isAvailable':
        return isAvailable;
      case 'imageUrl':
        return imageUrl;
      case 'priceRange':
        return priceRange;
      case 'category':
        return category;
      default:
        throw ArgumentError('Property `$prop` does not exist on Product.');
    }
  }
}