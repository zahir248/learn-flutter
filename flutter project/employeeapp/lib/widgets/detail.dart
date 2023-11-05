import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  int id;
  DetailPage({required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Detail Page"),),
        body: Text("Detail page for id ${widget.id}"),
        );
    }
}