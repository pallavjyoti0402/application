class Category {
  final String id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['category_id'].toString(),
      name: json['name'],
      image: json['photo'],
    );
  }
}
