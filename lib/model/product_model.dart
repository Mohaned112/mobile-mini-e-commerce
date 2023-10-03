import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final bool isRecommended;
  final bool isPopular;


  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,

  });
  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(name: snap['name'], category: snap['category'], imageUrl: snap['imageUrl'], price: snap['price'], isPopular: snap['isPopular'], isRecommended: snap['isRecommended'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
    isPopular,
    isRecommended,
  ];


}