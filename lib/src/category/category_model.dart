import 'package:QueVivaLaViva/src/recipe/recipe_model.dart';

class Category {
  String categoryName;
  List<Recipe> recipes = <Recipe>[];

  Category.fromJson(this.categoryName, Map json) {
    json.forEach((String keyName, Map recipeJson) {
      recipes.add(new Recipe.fromJson(recipeJson));
    });
  }
}