import 'package:flutter/material.dart';

class Newsdetailpage extends StatefulWidget {
  final String id;
  final String title;
  const Newsdetailpage({super.key, required this.id, required this.title});

  @override
  State<Newsdetailpage> createState() => _NewsdetailpageState();
}

class _NewsdetailpageState extends State<Newsdetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Text(widget.id),
        ],
      )),
    );
  }
}
