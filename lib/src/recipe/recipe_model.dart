class Recipe {
  String recipeName;
  List<String> images;

  Recipe.fromJson(Map json) {
    recipeName = json['name'];
    images = json['image_urls'];
  }
}