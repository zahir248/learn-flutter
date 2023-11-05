import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) In receiver, create a variable to store the received item
  Map<String,dynamic> item;

  // 2) Create constructor of the receiver class
  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Detail Page"),),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text("Name: ${item["name"]}", style: TextStyle(fontSize: 20)),
            Text("Description: ${item["desc"]}",style: TextStyle(fontSize: 20) ),
            Text("Place: ${item["place"]}",style: TextStyle(fontSize: 20)),
          ],
        )
      )
    ),
    );
  }
}

