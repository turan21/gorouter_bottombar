import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_navbar/screens/daniyar_page.dart';
import 'package:router_navbar/screens/daniyar_taskcalendar.dart';
import 'package:router_navbar/service/pocketbase_service.dart';

class Newspage extends StatefulWidget {
  static const String route = '/news';
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  void initState() {
    pocketBaseService.getUserData();
    super.initState();
  }

  Future<void> logout(BuildContext context) async {
    await pocketBaseService.clearAuth();
    print('logout');
    context.go('/login');
  }

  Future<Map<String, dynamic>> getUser() async {
    final record = await pocketBaseService.getUserData();
    return record!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests"),
        actions: [
          IconButton(
              onPressed: () => context.push('/login'), icon: Icon(Icons.login))
        ],
      ),
      body: SafeArea(
          child: Column(children: [
        Text('${pocketBaseService.isAuthenticated()}'),
        ElevatedButton(onPressed: () => logout(context), child: Text('logout')),
        ElevatedButton(
            onPressed: () => context.push(DaniyarPage.route),
            child: Text('Daniyar')),
        ElevatedButton(
            onPressed: () => context.push(TaskCalendarPage.route),
            child: Text('TaskCalendar'))
      ])),
    );
  }
}
