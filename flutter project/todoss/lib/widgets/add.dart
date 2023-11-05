import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  @override

  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Page"),),
        body: Center(
          child: Column(
            children: [
              Text("Please fill in the information"),
              TextField(decoration: InputDecoration(hintText: "Enter name"), controller: nameEditingController, ),
              TextField(decoration: InputDecoration(hintText: "Enter description"), controller: descEditingController,),
              TextField(decoration: InputDecoration(hintText: "Enter place"), controller: placeEditingController,),
              TextButton(onPressed: (){
                print(nameEditingController.text);
                print(descEditingController.text);
                print(placeEditingController.text);

                // it will go back to previous page

                // 2 In sender, passed the item as second argument of navigator, pop

                var newItem = {
                  "name":nameEditingController.text,
                  "desc":descEditingController.text,
                  "place":placeEditingController.text
                };

                Navigator.pop(context, newItem);

              }, child: Text("Add new item"))
            ],
          ),
        )
    );
  }
}

