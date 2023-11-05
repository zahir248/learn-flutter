import 'dart:convert';

import 'package:flutter/material.dart';
import 'add.dart';
import 'detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:employeeapp/models/employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> _employees = [{
    "name": "zahir",
    "email": "zahir@gmail.com",
    "department": "software",
    "address": "melaka",
    },
    {
      "name": "salah",
      "email": "salah@gmail.com",
      "department": "network",
      "address": "kedah",
    },
    {
      "name": "iqhwan",
      "email": "iqhwan@gmail.com",
      "department": "security",
      "address": "perak",
    },
  ];

  @override
  void initState(){
    // TODO: implement inistate
    super.initState();
    loadData();
  }

  void loadData() async{
    // load the file manager
    fetchEmployees().then((value) => {
      setState((){
        _employees = value;
    })
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Employee App"),
      actions: [
        IconButton(onPressed: () async{
          // 1) WAIT for this page to finish and receive the item passed
          // if you are using await keyword, you need to add async to the nearest function {}
          var passedItem = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));

          // 3) process the retrieved item

          if(passedItem != null) {
            _employees.add(passedItem);

            // Get the final manager
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            // Save as String : String, int, bool, double, List<String>
            // transform to string
            prefs.setString("todos", jsonEncode(_employees));

            setState(() {
              _employees;
            });
          }
        }, icon: Icon(Icons.add))
      ],),

      body:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _employees.length,
          // what to show for each row/ index
          // For each row/index I will show a Container/ div of height50, of color amber
          // Inside the container show a centered text showing the _todos at that position
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_employees[index].name),
                subtitle: Text(_employees[index].department),
                trailing: Icon(Icons.chevron_right),
                onTap: (){

                  // 3) Pass the item in constructor
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(id: _employees[index].id,)));
                },
              ),
            );
          }
      ),);
  }

  // Future -> The keyword future here means this is an asynchronous method..
  // < > -> The data type that is going to be returned by the API
  // -> If you are working with [] => It will be List<ClassName>
  // -> if you working with {} => It will be <Classname>


  Future<List<Employee>> fetchEmployees() async {
    final response = await http
        .get(Uri.parse('https://api.sheety.co/118e83921affd049f4d80efc4d5a7211/employees/sheet1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Employee.employeesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}