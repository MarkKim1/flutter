import 'dart:ui';

class Category {
  String name;
  String describe;
  String imgName;
  List<Category> subCategories;

  Category(
    {
      required this.name,
      required this.describe,
      required this.imgName,
      required this.subCategories
    }
  );
}