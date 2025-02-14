import 'package:flutter/material.dart';
import 'package:router_navbar/models/User.dart';
import 'package:router_navbar/models/difficulty.dart';
import 'package:router_navbar/widgets/quiz_card.dart';

import '../models/Quiz.dart';

class Newspage extends StatefulWidget {
  static const String route = '/news';
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<Quiz> quizes = [
    Quiz(
        count: 15,
        diff: QuizDifficulty.low,
        imageUrl:
            'https://images.prismic.io/prodigy-website/3b23b533-c408-4380-bce6-0820b89131e9_math-on-board.jpeg?auto=compress%2Cformat&rect=0%2C874%2C6048%2C2016&w=1920&h=640&fit=max',
        title: "Math 1",
        subtitle: "Trigonometry",
        onTap: () {
          print("Quiz tapped");
        }),
  ];
  List<User> users = [
    User(id: '15', name: 'Eldos', age: 17, salary: 15000, taxClass: 1),
    User(
        id: '16',
        name: 'Daniyar',
        age: 18,
        salary: 12000,
        taxClass: 1,
        ieltsScore: 6.5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ...users.map((el) => ListTile(
                  title: Text(el.name),
                  subtitle: Text(
                    el.age.toString(),
                  ),
                  trailing: Text("${el.ieltsScore ?? "no"}"),
                ))
          ],
        ),
      )),
    );
  }
}
