class Category {
  final String id;
  final String title;
  final String img;
  final String type;

  Category(
      {required this.id,
      required this.title,
      required this.img,
      required this.type});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        title: json['title'],
        img: json['img'],
        type: json['type']);
  }
}
