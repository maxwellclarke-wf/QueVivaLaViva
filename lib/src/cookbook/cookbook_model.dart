import 'package:QueVivaLaViva/src/category/category_model.dart';

class CookBook {
  List<Category> categories = [];

  CookBook.fromJson(Map json) {
    json.forEach((String categoryName, Map categoryJson) {
      categories.add(new Category.fromJson(categoryName, json));
    });
  }
}