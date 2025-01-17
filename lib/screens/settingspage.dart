import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const String route = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int a = 0;
  List<String> names = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Memory Leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Edit"),
              leading: Icon(Icons.pending),
            ),
            TextField(),
            Text("$a"),
            TextButton(
              onPressed: () {
                setState(() {
                  a++;
                });
              },
              child: Text("Increment"),
            ),
            TextButton(
              onPressed: () {
                a--;
              },
              child: Text("Decrement"),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Refresh"),
            )
          ],
        ));
  }
}
