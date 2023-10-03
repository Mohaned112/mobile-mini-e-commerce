import 'package:ecommerce_finalproject/model/categorry_models.dart';

abstract class BaseCategoryRepository{

  Stream<List<Category>> getAllCategories();

}