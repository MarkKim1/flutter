class Category {
  String name;
  String? troubleShootName;
  String describe;
  String imgName;
  List<String> subCategories;
  List<Map<String, String>>? troubleShootDescribe;

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
          ? (map['troubleShootDescribe'] as List).map((item) => Map<String, String>.from(item)).toList()
          : null,
    );
  }
}
