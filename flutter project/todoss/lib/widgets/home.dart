import 'dart:convert';

import 'package:flutter/material.dart';
import 'add.dart';
import 'detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> _todos = [{
    "name":"Multiple page",
    "desc":"How to structure multiple page",
    "place":"Amphi"},
    {
      "name":"Navigation",
      "desc":"Simple , pass data forward, pass data backward",
      "place":"Amphi"
    },
    {
      "name":"ListView",
      "desc":"ListView, ListTile and Card",
      "place":"Amphi"
    },
    {
      "name":"Dinner",
      "desc":"Nasi Ayam Amyra rusli",
      "place":"Ee ji ban, Melaka Raya"
    },
    {
      "name":"Shared Preference",
      "desc":"Save and restore data",
      "place":"Amphi"
    }
  ];

  @override
  void initState(){
    // TODO: implement inistate
    super.initState();
    loadData();
  }

  void loadData() async{
    // load the file manager
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var todosString = prefs.getString("todos");
    if (todosString != null){
      var todos = jsonDecode(todosString);
      setState((){
        _todos = todos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Todo List App"),
      actions: [
        IconButton(onPressed: () async{
          // 1) WAIT for this page to finish and receive the item passed
          // if you are using await keyword, you need to add async to the nearest function {}
          var passedItem = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));

          // 3) process the retrieved item

          if(passedItem != null) {
            _todos.add(passedItem);

            // Get the final manager
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            // Save as String : String, int, bool, double, List<String>
            // transform to string
            prefs.setString("todos", jsonEncode(_todos));

            setState(() {
              _todos;
            });
          }
        }, icon: Icon(Icons.add))
      ],),

      body:ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: _todos.length,
    // what to show for each row/ index
    // For each row/index I will show a Container/ div of height50, of color amber
    // Inside the container show a centered text showing the _todos at that position
    itemBuilder: (BuildContext context, int index) {
       return Card(
         child: ListTile(
           title: Text(_todos[index]["name"]!),
           subtitle: Text(_todos[index]["place"]!),
           trailing: Icon(Icons.chevron_right),
           onTap: (){

             // 3) Pass the item in constructor
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(item: _todos[index],)));
           },
         ),
       );
    }
    ),);
  }
}