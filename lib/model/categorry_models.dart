import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  static List<Category> categories = [
    Category(
        name: 'Iphone ',
        imageUrl:
            'https://th.bing.com/th?id=OIF.G8DP6w8C%2bHkdTV8XyRMQjw&pid=ImgDet&rs=1'),
    Category(
        name: 'Samsung',
        imageUrl:
            'https://th.bing.com/th/id/R.d36557f9a1e4e8e2e270265950fd8c95?rik=vL3hr%2fq423xJCQ&pid=ImgRaw&r=0'),
    Category(
        name: 'Oppo',
        imageUrl:
            'https://th.bing.com/th/id/R.9f9b734faa87110c2617c5f5c7fedfc6?rik=mfl18%2fY7cd7uxg&pid=ImgRaw&r=0'),
  ];
}
