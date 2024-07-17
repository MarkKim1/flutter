class Category {
  String name;
  String? troubleShootName;
  String describe;
  List<String> subCategories;
  List<Map<String, dynamic>>? troubleShootDescribe;

  Category({
    required this.name,
    required this.describe,
    required this.subCategories,
    this.troubleShootName,
    this.troubleShootDescribe,
  });

  // Factory method to create Category from a map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      describe: map['describe'],
      subCategories: List<String>.from(map['subCategories'] ?? []),
      troubleShootName: map['troubleShootName'],
      troubleShootDescribe: map['troubleShootDescribe'] != null
          ? (map['troubleShootDescribe'] as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList()
          : null,
    );
  }
}
