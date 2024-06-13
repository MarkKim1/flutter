import 'dart:ui';

class Category {
  String name;
  String? troubleShootName;
  String describe;
  String imgName;
  List<String> subCategories;
  Map<String, String>? troubleShootDescribe;

  Category({
    required this.name,
    required this.describe,
    required this.imgName,
    required this.subCategories,
    this.troubleShootName,
    this.troubleShootDescribe,
  });

  // Factory method to create Category from a map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      describe: map['describe'],
      imgName: map['imgName'],
      subCategories: List<String>.from(map['subCategories'] ?? []),
      troubleShootName: map['troubleShootName'],
      troubleShootDescribe: map['troubleShootDescribe'] != null
          ? Map<String, String>.from(map['troubleShootDescribe'])
          : null,
    );
  }
}
