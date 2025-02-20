import 'category.dart';

class Car {
  final String id;
  final String collectionId;
  final String collectionName;
  final String title;
  final String model;
  final String img;
  final int km;
  final int hp;
  final String engine;
  final Category? category;

  Car(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.title,
      required this.model,
      required this.img,
      required this.km,
      required this.hp,
      required this.engine,
      this.category});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        id: json['id'],
        collectionId: json['collectionId'],
        collectionName: json['collectionName'],
        title: json['title'],
        model: json['model'],
        hp: json['hp'] as int,
        km: json['km'] as int,
        img: json['img'],
        category: Category.fromJson(json['expand']['category']),
        engine: json['engine']);
  }
}
