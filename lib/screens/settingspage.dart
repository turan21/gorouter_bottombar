import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
          child: Text("AKLSDJLKASJDLKASJLDKJS"),
        ));
  }
}
