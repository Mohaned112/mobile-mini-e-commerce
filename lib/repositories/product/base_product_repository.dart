import 'package:ecommerce_finalproject/model/models.dart';

abstract class  BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}