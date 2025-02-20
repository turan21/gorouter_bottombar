import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:router_navbar/models/User.dart';
import 'package:router_navbar/models/difficulty.dart';
import 'package:router_navbar/widgets/quiz_card.dart';

import '../models/Car.dart';
import '../models/Quiz.dart';

class Newspage extends StatefulWidget {
  static const String route = '/news';
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  late Future<List<Car>> _cars;
  @override
  void initState() {
    _cars = _fetchCars();
    super.initState();
  }

  Future<List<Car>> _fetchCars() async {
    try {
      final pb = PocketBase('https://restaurant-menu.fly.dev');

      final records = await pb
          .collection('cars')
          .getFullList(sort: '-created', expand: 'category');
      List<Car> cars = records.map((e) => Car.fromJson(e.toJson())).toList();
      return cars;
    } catch (e) {
      throw Exception('Failed to fetch quiz details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests"),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _cars,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No news available.'));
              }
              final cars = snapshot.data!;
              return ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(cars[index].title),
                  subtitle: Text(cars[index].category?.title ?? "asd"),
                ),
              );
            }),
      ),
    );
  }
}
